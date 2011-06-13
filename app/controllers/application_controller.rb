class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
	def set_locale
  	# if params[:locale] is nil then I18n.default_locale will be used
  	I18n.locale = params[:locale]
  end
  
   # append ?locale= to the URL
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  def set_locale_and_redirect
		logger.debug "*** ApplicationController: set_locale_and_redirect : Params " + params.inspect
		logger.debug  "*** ApplicationController: set_locale_and_redirect : Request " + request.inspect
		logger.debug "*** ApplicationController: set_locale_and_redirect : NEW REQUEST" + request.env["HTTP_REFERER"]
		redirect_url = request.env["HTTP_REFERER"]
		if params[:locale].nil?
			redirect_to redirect_url
		elsif redirect_url.include? 'locale'
			logger.debug "*** ApplicationController: set_locale_and_redirect : locale included in the previous URL"
			redirect_to redirect_url.gsub(/locale=../,'locale='+params[:locale])
		else
			logger.debug "*** ApplicationController: set_locale_and_redirect : Appending locale"
			redirect_to redirect_url + '?locale='+params[:locale]
		end
	end
end
