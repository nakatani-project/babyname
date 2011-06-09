class Baby < ActiveRecord::Base
	
	before_validation :clean_up_whitespace
	def clean_up_whitespace
    	self.name.strip!    # this does the strip in place
    	#self.name.capitalize!
  	end

	validate do |babyname|
	    	babyname.errors[:base] << "Please provide a name" if babyname.name.blank?
	    	babyname.errors[:base] << "Please select at least one region" if babyname.babyregions.empty?
	    	babyname.errors[:base] << "Please select at least one language" if babyname.babylangs.empty?
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
      where('name LIKE ?', "%#{search}%")  #rails3 previously find(:all, :condition =>....
    else  
      scoped  #rails 3 previously find(:all)
    end  
  end  

end
