class Babyregion < ActiveRecord::Base
  belongs_to :baby
  belongs_to :region
  
  # virtual attribute region_name
  # get method (for editing?)
  # return name of region if there is any 
  def region_name
    if region == nil
      puts "region nil"
    else
      puts "region_name called with 'region.name': " + region.name + " and 'region':" + region
    end
    region.name if region
  end
  
  # set method
  def region_name=(region)
    puts "REGION: " + region.to_s
    #puts "Name: " + name.to_s
    puts "Region.find_by_name(region): " + Region.find_by_name(region).inspect
    self.region = Region.find_or_create_by_name(region) unless region.blank? #in the tutorial, 'region' was 'name'
  end
end
