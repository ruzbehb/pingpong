class MatchesController < ApplicationController
	layout 'matches'

	def edit
		@match = Match.find(params[:id])
	end

	def new
		@match = Match.new
	end

end
