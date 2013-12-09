class Players::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/player.rb)
    @player = Player.find_for_facebook_oauth(request.env["omniauth.auth"], current_player)
    if @player.persisted?
      sign_in_and_redirect @player, :event => :authentication #this will throw if @player is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_player_registration_url
    end
  end

  def google_oauth2
     
    @player = Player.find_for_google_oauth2(request.env["omniauth.auth"], current_player)
    
    if @player.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @player, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_player_registration_url
    end

  end
end