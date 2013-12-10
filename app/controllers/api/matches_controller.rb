class Api::MatchesController < ApplicationController
	respond_to :json
 
	  def update
	    @match = Match.find(params[:id])
	    @player = (params[:player_id])
	    # @match.update_score(@player)
	    # render json: @match
 	  end

end