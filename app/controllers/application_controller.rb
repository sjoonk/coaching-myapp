class ApplicationController < ActionController::Base
  # protect_from_forgery

  # before_filter :authenticate
  # 
  # def authenticate
  #   authenticate_or_request_with_http_basic('Administration') do |username, password|
  #     username == 'admin' && password == 'password'
  #   end
  # end

  # helper_method :current_user  
  #   
  # private  
  # 
  # def current_user  
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  # end

  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || entries_path
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   # logic here
  # end

end
