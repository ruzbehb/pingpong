class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  	player = Player.where(:provider => auth.provider, :uid => auth.uid).first
	  unless player
	    player = Player.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
                           image_url:auth.info.image,
                           first_name:auth.info.first_name,
                           last_name:auth.info.last_name,
                           fb_url:auth.info.Facebook,
                           current_location:auth.info.location,
                           # hometown:auth.hometown.name,
                           # sex:auth. .sex,
	                         password:Devise.friendly_token[0,20]
	                         )
	  end
  	player
	end

	def self.new_with_session(params, session)
    super.tap do |player|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        player.email = data["email"] if player.email.blank?
      end
    end
  end

end
