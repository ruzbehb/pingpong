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
		@matches = @player.matches.last(3).sort_by {|obj| obj.updated_at}.reverse
	end

end
