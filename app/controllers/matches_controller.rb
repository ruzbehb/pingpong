class MatchesController < ApplicationController
	layout 'matches'

	def edit
		@match = Match.find(params[:id])

		@p1 = params[:p1]
		@p2 = params[:p2]
		
	end

	def new

	end

	def create
		@match = Match.create
		@players = @match.add_players(params[:p1_name], params[:p2_name])

		@p1 = @players.first 
		@p2 = @players.last

		redirect_to edit_match_path(@match, p1: @p1, p2: @p2)

	end

end
