class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @player = Player.find_for_facebook_oauth(request.env["omniauth.auth"], current_player)
    if @player.persisted?
      sign_in_and_redirect @player, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_player_registration_url
    end
  end
end