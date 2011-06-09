class Meaning < ActiveRecord::Base
   belongs_to :babylang
   
   before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.character.strip!    # this does the strip in place
    self.meaning.strip!
    self.meaning.capitalize!
  end
end
