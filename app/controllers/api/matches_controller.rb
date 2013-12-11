class Api::MatchesController < ApplicationController
	respond_to :json
 
	  def update
	    @match = Match.find(params[:id])
	    @player = (params[:player_id])
	    # @match.update_progress(@player)
	    # render json: @match
 	  end

 	  def create
	    @player = (params[:player_id])
	    @decrement = (params[:decrement])
	    puts "puts player_id: #{@player}"
	    puts "puts decrement: #{@decrement}"
	    render :update
 	  end

end