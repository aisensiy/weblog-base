class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

    if authentication
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      redirect_to root_path
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        sign_in_and_redirect(:user, user)
      end
    end
  end

  alias_method :weibo, :all
end
