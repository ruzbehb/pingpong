class Score < ActiveRecord::Base

	has_many :games
	belongs_to :player
	belongs_to :match
	after_create :add_first_game

	def add_first_game
		self.games << Game.create(number: 1)
	end

	def new_game
		prev_game = games.last
		self.games << Game.create(number: prev_game.number + 1)
	end

	def match_finished?
		won_games == 2
	end

	def game_won
		self.won_games = (won_games || 0) + 1

		if match_finished?
			match.find_winner
		else
			new_game
			match.update_game_number
		end

	end

	def current_game
		self.games.last
	end

end
