class Region < ActiveRecord::Base
  validates_uniqueness_of :name, :case_sensitive => false, :message => "already exists"
   #validates_presence_of :name, :message => "You forgot to enter a region"
   
  validate do |region|
    region.errors.add_to_base("* Please select at least one region *") if region.name.blank?
  end

   #has_and_belongs_to_many :babynames #, :dependent => :destroy
   has_many :ranks, :dependent => :destroy
   has_many :babyregions, :dependent => :destroy
end
