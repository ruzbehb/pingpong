class Api::MatchesController < ApplicationController
	respond_to :json
 
	  def update
	    @match = Match.find(params[:id])
	    @player = (params[:player_id])
 	  end

end