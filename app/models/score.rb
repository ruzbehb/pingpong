class Score < ActiveRecord::Base

	has_many :games
	belongs_to :player
	belongs_to :match
	after_create :add_first_game

	attr_accessor :won_games

	def add_first_game
		self.games << Game.create(number: 1)
		self.won_games = 0
	end

	def new_game
		prev_game = games.last
		self.games << Game.create(number: prev_game.number + 1)
		# match.update_game_number
	end

	def game_won
		self.won_games +=1
		if match_finished?
			match.find_winner
		else
			new_game
			match.update_game_number
		end
	end

	def match_finished?
		won_games == 2
	end

	def current_game
		self.games.last
	end

end
