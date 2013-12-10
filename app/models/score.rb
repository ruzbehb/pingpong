class Score < ActiveRecord::Base

	has_many :games
	belongs_to :player
	belongs_to :match
	after_create :add_first_game

	attr_accessor :won_games, :lost_games


	def new_game
		prev_game = games.last

		self.games << Game.create(number: prev_game.number + 1)
	end

	def add_first_game
		self.games << Game.create(number: 1)
		@lost_games = 0
		@won_games = 0
	end

	def game_won
		@won_games +=1
		if @won_games == 2
			match.match_over
			player.match_won
		else
			new_game
		end
	end

	def game_lost
		@lost_games +=1
		if @lost_games == 2
			match.match_over
			player.match_lost
		else
			new_game	
		end
	end

	def match_finished?
		@lost_games || @won_games == 2
	end

end
