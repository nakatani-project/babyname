class Baby < ActiveRecord::Base
	
	before_validation :clean_up_whitespace
	def clean_up_whitespace
    	self.name.strip!    # this does the strip in place
    	#self.name.capitalize!
  	end

	validate do |babyname|
    	babyname.errors.add_to_base("Please provide a name") if babyname.name.blank?
    	babyname.errors.add_to_base("Please select at least one region") if babyname.babyregions.empty?
    	babyname.errors.add_to_base("Please select at least one language") if babyname.babylangs.empty?
    
	    # let's find duplicates of regions and delete one of the duplicates without warning
	    num = 1
	    babyname.babyregions.each do |r1|
	          # avoiding same comparisons by specifying the range [start..end]
	      babyname.babyregions[num..babyname.babyregions.size].each do |r2|
	            if r1.region_id == r2.region_id
	              #babyname.errors.add_to_base("Duplicate regions: " + Region.find(r1.region_id).name)
	              babyname.babyregions.delete(r2)
	            end # end of if
	          end # end of inner loop
	          num = num + 1
	      end # end of outer loop
	      
	      # let's find duplicates of languages and warn the user
	      num = 1
	      bgender = ''
	      babyname.babylangs.each do |l1|
	          # avoiding same comparisons by specifying the range [start..end]
	          babyname.babylangs[num..babyname.babylangs.size].each do |l2|
	            if l1.lang_id == l2.lang_id
	              #babyname.babylangs.delete(l2)
	              babyname.errors.add_to_base("Duplicate language - " + Language.find(l1.lang_id).name + " - could not be saved") 
	            end # end of if
	          end # end of inner loop
	          num = num + 1
	          # Assigning sex
	          if l1.gender == 'Unisex' or bgender == 'Unisex'
	            bgender = 'Unisex'
	          elsif l1.gender == 'Boy'
	            if bgender == 'Girl'
	              bgender = 'Unisex'
	            else
	              bgender = 'Boy'
	            end
	          elsif l1.gender == 'Girl'
	            if bgender == 'Boy'
	              bgender = 'Unisex'
	            else
	              bgender = 'Girl'
	            end
	          end # end of assigning sex
	      end # end of outer loop
	      babyname.lang_count = babyname.babylangs.size
	      babyname.gender = bgender
	  end
	  
	  validates_uniqueness_of   :name, :case_sensitive => false, :message =>"already exists"
	  has_many :celebs, :dependent => :destroy
	  has_many :babylangs, :dependent => :destroy
	  has_many :babyregions, :dependent => :destroy
	  has_many :materials, :dependent => :destroy
	  has_many :relateds, :dependent => :destroy
	  
	  # a['lang_id'] == nil if the pull-down menu's default is 'Any' otherwisen use ''
	  accepts_nested_attributes_for :celebs, :reject_if => lambda { |a| a['last_name'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :babylangs, :reject_if => lambda { |a| a['lang_id'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :babyregions, :reject_if => lambda { |a| a['region_id'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :materials, :reject_if => lambda { |a| a['title'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :relateds, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
	  
  def self.search(search)  
    if search  
      where('name LIKE ?', "%#{search}%")  #rails3 previously find(:all, :condition =>....
    else  
      scoped  #rails 3 previously find(:all)
    end  
  end  

end
