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
		@matches = Match.where((score(1).player_id == @player.id or score(2).player_id == @player.id))
		# raise @matches.inspect
	end

end
