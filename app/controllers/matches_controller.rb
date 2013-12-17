class MatchesController < ApplicationController
	layout 'matches'

	def index
		@matches = Match.all(order: 'created_at DESC')
		# @match = Match.find(params[:match_id])
	end

	def edit

		@match = Match.find(params[:id])
		@show_reset_button = true
	end


	def new

	end


	def create
		
		@match = Match.create
		@match.add_players(params[:p1_name], params[:p2_name])
		redirect_to edit_match_path(@match)

	end

	def show
		@match = Match.find(params[:id])
		# if @match.save
			# WebsocketRails[:table].trigger 'edit', {
				

			# }
		# end
		# redirect_to match_path(match)
	end

end
