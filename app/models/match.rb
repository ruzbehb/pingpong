class Match < ActiveRecord::Base
	has_and_belongs_to_many :players
	has_many :scores
	has_many :games, :through => :scores
	after_create :add_players
	after_create :add_scores

	def add_players
		@player1 = Player.create(guest: true, email: "#{rand(200)}@guest.com", password: "password", password_confirmation: "password")
		@player2 = Player.create(guest: true, email: "#{rand(200)}@guest.com", password: "password", password_confirmation: "password")
		self.players << [@player1, @player2]
	end

	def add_scores
		@score1 = Score.create(player: @player1)
		@score2 = Score.create(player: @player2)
		self.scores << [@score1, @score2]
	end

	def current_points_for(score)
		scores[score-1].current_game.points
	end

	def same_game?
		@score1.current_game.number && @score2.current_game.number
	end

	def update_game_number
		if score(1).current_game.number > score(2).current_game.number
			score(2).new_game
		elsif score(1).current_game.number < score(2).current_game.number
			score(1).new_game
		else
		end
	end

	def score(n)
		scores[n-1]
	end

	def find_winner
		if score(1).match_finished?
			score(1).player
		elsif score(2).match_finished?
			score(2).player
		else
			'game still in progress'
		end
	end

	def point_change
		# raise 'made it!'
		raise([current_points_for(1), current_points_for(2)].inspect)
		if current_points_for(1) > 9 && current_points_for(2) > 9 && current_points_for(1) > current_points_for(2) + 1
			score(1).game_won
		elsif current_points_for(1) > 9 && current_points_for(2) > 9 && current_points_for(2) > current_points_for(1) + 1
			score(2).game_won
		elsif current_points_for(1) == 11 && current_points_for(2) < 10
			score(1).game_won
		elsif current_points_for(2) == 11 && current_points_for(1) <10
			score(2).game_won

		else
			"continue game"
		end
	end

	def list_points_for current_score
		score_array = []
		scores[current_score-1].games.each{|game| score_array << game.points}
		score_array
	end

	def serving

	end

	# def update_progress
	# 	point_change
	# 	if point_change != "continue game"
	# 		update_game_number
	# 	end

	# end

end
