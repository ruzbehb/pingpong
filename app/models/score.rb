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

	def game(num)
		games[num-1]
	end

	def match_finished?
		# sleep 2u
		# puts "match finished method"
		won_games == 2
		# puts "end of match finished method"
	end

	def game_won
		# puts"game is won by #{self.id}"
		update_attribute(:won_games,won_games + 1)
		# sleep 2
		
		# puts "updating won_games number"
		if match_finished?
			# sleep 2
			# puts "match finished"
			# console.log('hello')
			# match.over?
		else
			new_game
			# puts "new game"
			
			match.update_game_number
		end
		# puts "are you going here?"

	end

	def current_game
		self.games.last
	end

end
