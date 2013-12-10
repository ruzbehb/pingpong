class ClubsController < ApplicationController

	def index
		@clubs = Club.all
		
		@hash = Gmaps4rails.build_markers(@clubs) do |club, marker|
  		marker.lat club.latitude
  		marker.lng club.longitude
		end
	
	end

	def show
		@club = Club.find params[:id]
	end

end
