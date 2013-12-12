class ClubsController < ApplicationController

	def index
		@clubs = Club.all
		
		@club_locations = Gmaps4rails.build_markers(@clubs) do |club, marker|
  		marker.lat club.latitude
  		marker.lng club.longitude
  		marker.infowindow render_to_string(:partial => "/clubs/infowindow", :locals => { :club => club})
  		marker.picture({
                  :picture => "tabletennis_gmap.png",
                  :width   => 32,
                  :height  => 32
                 })
  		marker.json({ title: club.name})
		end
	
	end

	def create
		user_location = params[:user_location]
		redirect_to clubs_path
	end

	def show
		@club = Club.find params[:id]
	end

end
