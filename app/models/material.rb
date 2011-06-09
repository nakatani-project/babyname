class Material < ActiveRecord::Base
  belongs_to :baby
  before_validation :clean_up_whitespace

  def clean_up_whitespace
    self.title.strip!    # this does the strip in place
    #self.title.capitalize!
  end
end
