class Language < ActiveRecord::Base
	validates_presence_of :name
   	validates_uniqueness_of	:name, :case_sensitive => false, :message => "already exists"
end
