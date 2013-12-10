class Api::MatchesController < ApplicationController
	respond_to :json
 
	  def index
	    @matches = Match.all
	    respond_with @matches
 	  end

end