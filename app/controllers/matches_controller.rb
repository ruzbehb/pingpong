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
		params.reject! { |k, v| v.empty? }

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

	def connect
		@match = Match.find(params[:id])
		@guest1 = @match.player(1)
		@guest2 = @match.player(2)
		@score1 = @match.score(1)
		@score2 = @match.score(2)
	
	end

	def player_saved
		@match = Match.find(params[:id])
		@guest1 = @match.player(1)
		@guest2 = @match.player(2)
		@score1 = @match.score(1)
		@score2 = @match.score(2)

	  @player1_email = params[:player1]
		@player2_email = params[:player2]

		@player1 = Player.where(:email => @player1_email).first
		@player2 = Player.where(:email => @player2_email).first

		

		if !@player1 or !@player2
			@player_found = false
		else
			@match.score(1).player_id = @player1.id
			@match.score(1).save
			@match.score(2).player_id = @player2.id
			@match.score(2).save

			@player_found = true
			flash[:notice] = "profiles saved"
			redirect_to new_match_path
		end
	
	end

end
