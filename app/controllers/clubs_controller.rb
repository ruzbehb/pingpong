class ClubsController < ApplicationController

	def index
		@clubs = Club.all
	end

	def show
		@club = Club.find params[:id]
	end

end
