class Api::MatchesController < ApplicationController
	respond_to :json
 
	  def update
	    @match = Match.find(params[:id])
	    @player = Player.find(params[:player_id])
	    @point_direction = (params[:decrement])
	    player_index = @match.players.index(@player)
	    if @point_direction == true
	    	@match.scores[player_index].current_game.award_point
	    else
	    	@match.scores[player_index].current_game.delete_point
	    end

	    # render :update
 	  end

end