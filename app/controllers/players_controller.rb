class PlayersController < ApplicationController

	def index
		@players = Player.all 
		if current_player
			@players -= [current_player]
			@players = @players.unshift current_player
		end
	end

	def show
		@player = Player.find params[:id]
		@all_matches = Match.all
		@matches = @player.matches.first(5)
	end

end
