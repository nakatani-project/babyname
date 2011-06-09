class Babylang < ActiveRecord::Base
  belongs_to :baby
  
 before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.pronun.strip!    # this does the strip in place
  end
  
  validates_presence_of :lang_id
 
  has_many :meanings, :dependent => :destroy
  has_many :nicknames, :dependent => :destroy
  has_many :origins, :dependent => :destroy
  has_many :shorts, :dependent => :destroy
  
  accepts_nested_attributes_for :meanings, :reject_if => lambda { |a| a['meaning'] == '' && a['character'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :nicknames, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :origins, :reject_if => lambda { |a| a['lang_id'] == '' }, :allow_destroy => true
  accepts_nested_attributes_for :shorts, :reject_if => lambda { |a| a['name'] == '' }, :allow_destroy => true
end
