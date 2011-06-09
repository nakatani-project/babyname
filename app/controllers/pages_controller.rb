class PagesController < ApplicationController
  def home
  end

  def translate
  	redirect_to(root_path)
  end
end
