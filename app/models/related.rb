class Related < ActiveRecord::Base
  belongs_to :baby
  before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.name.strip!    # this does the strip in place
    self.name.capitalize!
  end
end
