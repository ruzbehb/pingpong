class Score < ActiveRecord::Base

	has_many :games, order: 'id ASC'
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
		puts won_games
		update_attribute(:won_games,won_games + 1)
		if match_finished?
			match.over?
		else
			new_game
			
			match.update_game_number
		end

	end

	def current_game
		self.games.last
	end

end
