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
	end

end
