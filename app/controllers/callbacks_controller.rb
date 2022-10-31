class CallbacksController < Devise::OmniauthCallbacksController
  def github
    auth_hash = request.env['omniauth.auth']
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect(@user)
  end

  def twitter
    auth_hash = request.env['omniauth.auth']
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect(@user)
  end

  def google_oauth2
    auth_hash = request.env['omniauth.auth']
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect(@user)
  end

  def facebook
    auth_hash = request.env['omniauth.auth']
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect(@user)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
