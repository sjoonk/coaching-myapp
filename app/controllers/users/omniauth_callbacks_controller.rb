class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def twitter
  #   raise request.env['omniauth.auth'].inspect
  # end

  def twitter
    @user = User.find_or_create_for_twitter(auth_hash)
    flash[:notice] = "Signed in with Twitter successfully."
    sign_in_and_redirect @user, :event => :authentication
  end
  
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
  
end
