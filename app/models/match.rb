class Match < ActiveRecord::Base
	has_and_belongs_to_many :players
	has_many :scores
	has_many :games, :through => :scores
	# after_create :add_players
	after_create :add_scores

	def add_players(p1name, p2name)
		@player1 = Player.create(guest: true, email: "#{rand(2000000)}@guest.com", password: "password", password_confirmation: "password", name: p1name)
		@player2 = Player.create(guest: true, email: "#{rand(2000000)}@guest.com", password: "password", password_confirmation: "password",  name: p2name)
		self.players << [@player1, @player2]
	end

	def add_scores
		@score1 = Score.create(player: @player1)
		@score2 = Score.create(player: @player2)
		self.scores << [@score1, @score2]
	end

	def player1_name
		players.first.name
	end

	def player2_name
		players.last.name
	end

	def current_points_for(player)
		scores[player-1].current_game.points
	end

	def score(n)
		scores[n-1]
	end

	def point_change
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

	def update_game_number
		if score(1).current_game.number > score(2).current_game.number
			score(2).new_game
		elsif score(1).current_game.number < score(2).current_game.number
			score(1).new_game
		else
		end
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

	def list_points_for current_score
		score_array = []
		scores[current_score-1].games.each{|game| score_array << game.points}
		score_array
	end

	# def same_game?
	# 	@score1.current_game.number && @score2.current_game.number
	# end

	def serving

	end

	def points_played
		# array = []

	end

end
