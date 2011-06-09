class Babylang < ActiveRecord::Base
  belongs_to :baby
  belongs_to :language
  
  before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.pronun.strip!    # this does the strip in place
  end
  
  validates_presence_of :language_id
 
  has_many :meanings, :dependent => :destroy
  has_many :nicknames, :dependent => :destroy
  has_many :origins, :dependent => :destroy
  has_many :shorts, :dependent => :destroy
  
  accepts_nested_attributes_for :meanings, :reject_if => lambda { |a| a['meaning'] == '' && a['character'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :nicknames, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :origins, :reject_if => lambda { |a| a['language_id'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :shorts, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
 

  
  def meaning_property_aggregator(property)
  	meaning_meaning_array = Array.new

  	for meaning in self.meanings
  		case property
  		when "meaning"
  			meaning_meaning_array << meaning.meaning if !meaning.meaning.empty?
  		when "character"
  			meaning_meaning_array << meaning.character if !meaning.character.empty?
  		end	  		
  	end
  	meaning_meaning_array.join(", ")
  end
  
  def origins_property_aggregator
  	str = ""
  	counter = 0
  	for orig in self.origins
  		if !Originlang.find(orig.originlang_id).nil?
			str += Originlang.find(orig.originlang_id).name
		end
		if !orig.name.empty?
			str += "(" + orig.name + ")"
		end
		if counter < (self.origins.size - 1)
			str += ", "
		end
		counter = counter + 1
		
	end
	return str
  end
  
end
