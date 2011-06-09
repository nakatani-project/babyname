class Celeb < ActiveRecord::Base
	belongs_to :baby
    before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.last_name.strip!    # this does the strip in place
    #self.last_name.capitalize!
  end

end
