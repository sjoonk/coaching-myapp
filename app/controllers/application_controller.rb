class ApplicationController < ActionController::Base
  protect_from_forgery

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
  
end
