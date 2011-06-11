class Baby < ActiveRecord::Base
	
	# before_validation :clean_up_whitespace
	def clean_up_whitespace
			if !self.name.nil?
	    		self.name.strip!    # this does the strip in place
	    	end
	    	#self.name.capitalize!
	end
	
	validate do |babyname|
			puts "Validating"
			if babyname.name.blank?
				puts "Baby name was blank"
				babyname.errors[:base] << "Please provide a name"	
			end
			if babyname.babyregions.empty?
				puts "Baby regions was blank"
				babyname.errors[:base] << "Please select at least one region"
			end
			if babyname.babylangs.empty?
				puts "Baby langs was blank"
				babyname.errors[:base] << "Please select at least one language"
			else
				# determine the gender
				boycount = 0
				girlcount = 0
				unisexcount = 0
				babyname.babylangs.each do |lang|
					if lang.gender == 'Girl'
						girlcount = girlcount + 1
					elsif lang.gender == 'Boy'
						boycount = boycount + 1
					else
						unisexcount = unisexcount + 1
					end
				end
				if unisexcount > 0
					babyname.gender = 'Unisex'
				elsif girlcount > 0 and boycount > 0
					babyname.gender = 'Unisex'
				elsif girlcount > boycount
					babyname.gender = 'Girl'
				else
					babyname.gender = 'Boy'
				end
				babyname.lang_count = babyname.babylangs.size
			end
	    	 
	    	
	    	# babyname.errors[:base] << "Please select at least one region" if babyname.babyregions.empty?
	    	# babyname.errors[:base] << "Please select at least one language" if babyname.babylangs.empty?
	end
	  
	  validates_uniqueness_of   :name, :case_sensitive => false, :message =>"already exists"
	  has_many :celebs, :dependent => :destroy
	  has_many :babylangs, :dependent => :destroy
	  has_many :languages, :through => :babylangs
	  has_many :babyregions, :dependent => :destroy
	  has_many :regions, :through => :babyregions
	  has_many :materials, :dependent => :destroy
	  has_many :relateds, :dependent => :destroy
	  
	  # a['lang_id'] == nil if the pull-down menu's default is 'Any' otherwisen use ''
	  accepts_nested_attributes_for :celebs, :reject_if => lambda { |a| a['last_name'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :babylangs, :reject_if => lambda { |a| a['language_id'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :babyregions, :reject_if => lambda { |a| a['region_id'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :materials, :reject_if => lambda { |a| a['title'] == '' }, :allow_destroy => true
	  accepts_nested_attributes_for :relateds, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
	  
  def self.search(search)  
    if search  
      where('lower(name) LIKE ?', "%#{search}%")  #rails3 previously find(:all, :condition =>....
    else  
      scoped  #rails 3 previously find(:all)
    end  
  end  

end
