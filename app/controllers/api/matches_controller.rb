class Api::MatchesController < ApplicationController
	respond_to :json

	include MatchesHelper
 
	  def update
	    @match = Match.find(params[:id])
	    @new_game = (params[:new_game])
	    
	    if @new_game == "true" && @match.is_player_one_the_winner?
	    	@match.score(1).game_won
	    elsif @new_game == "true" && @match.is_player_two_the_winner?
	    	@match.score(2).game_won
	    else
	    	@player = Player.find(params[:player_id])
		    @point_direction = (params[:decrement])
		    player_index = @match.players.index(@player)

		    if @point_direction == "true"
		    	@match.score(1).current_game.completed = false
		    	@match.score(2).current_game.completed = false
		    	@match.scores[player_index].current_game.delete_point
		    else
		    	@match.scores[player_index].current_game.award_point
		    end
		    
		  end
	    
	    WebsocketRails["table#{@match.id}"].trigger 'edit', table_data(@match, player_index, @point_direction, @new_game)
 	  end

end