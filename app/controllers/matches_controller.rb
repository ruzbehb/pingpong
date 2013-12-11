class MatchesController < ApplicationController
	layout 'matches'

	def edit
		@match = Match.find(params[:id])
	end

	def new

	end

	def create
		match = Match.create
		match.add_players(params[:p1_name], params[:p2_name])

		redirect_to edit_match_path(match)
		# raise params.inspect
# {"utf8"=>"✓", "p1_name"=>"Natalie", "p2_name"=>"Will", }

	end

end
