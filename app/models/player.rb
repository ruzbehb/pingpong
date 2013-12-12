class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable #, :validatable

  validates :email, presence: { message: '*please complete' }
  validates :password, presence: { message: '*please complete' }
  validates :password_confirmation, presence: { message: '*please complete' }

  has_and_belongs_to_many :matches
  has_many :scores

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
                           fb_url:auth.info.urls.Facebook,
                           current_location:auth.info.location,
                           hometown:auth.extra.raw_info.hometown.name,
                           sex:auth.extra.raw_info.gender,
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

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    player = Player.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if player
      return player
    else
      registered_player = Player.where(:email => access_token.info.email).first
      if registered_player
        return registered_player
      else
        player = Player.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          first_name: access_token.info.first_name,
          last_name: access_token.info.last_name,
          image_url: access_token.info.image,
          google_url: access_token.info.urls.Google,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end

end
