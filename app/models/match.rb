class Match < ActiveRecord::Base
	# has_and_belongs_to_many :players
	has_many :players, through: :scores, order: 'id ASC'

	has_many :scores, order: 'id ASC'

	has_many :games, :through => :scores, order: 'id ASC'
	# after_create :add_players
	# after_create :add_scores

	def add_players(player_one, player_two)
		self.scores = [associate_score_to(guest_player_named(player_one)), associate_score_to(guest_player_named(player_two))]
	end

	def guest_player_named(name)
		Player.create(guest: true, email: "#{rand(2000000)}@guest.com", password: "password", password_confirmation: "password", name: name)
	end

	def associate_score_to(player)
		Score.create(player: player)
	end

	def score(num)
		scores[num-1]
	end

	def player(num)
		players[num-1]
	end

	def name_of_player(num) #change linked methods for player1_name and player2_name
		players[num-1].name
	end

	def current_points_for_player(num)
		score(num).current_game.points
	end

	def reports_game_won_to_score(num)
		score(num).game_won
	end

	def player_one_wins
		reports_game_won_to_score(1)
	end

	def player_two_wins
		reports_game_won_to_score(2)
	end

	def point_change
		# alert "hello"
		# finish_game?
		player_one_wins if is_player_one_the_winner?
		player_two_wins if is_player_two_the_winner?
	end

	def finish_game?
		if is_player_one_the_winner? || is_player_two_the_winner?
			# alert('do you want to finish this game?')
		end
	end

	def halt!
		
	end

	def invoke_new_game_to_score(num)
		score(num).new_game
	end

	def update_oppositions_game_number
		invoke_new_game_to_score(2) if score(1).current_game.number > score(2).current_game.number
		invoke_new_game_to_score(1) if score(1).current_game.number < score(2).current_game.number
	end

	#tidy up winning methods. Too many?

	def game_winner(num)
		if score(1).game(num) !=nil && point_change != "continue game"
			name_of_player(1) if score(1).game(num).points > score(2).games[0].points
			name_of_player(2) if score(2).game(num).points > score(1).games[0].points
		end
	end

	def over?
		find_winning_score.any?
	end

	def find_winner
		find_winning_score.first.try(:player) || 'game still in progress'
	end

	def find_winning_score
		scores.select(&:match_finished?)
	end

	def list_points_for_current_score
		score_array = []
		players_current_score.games.each{ |game| score_array << game.points }
		score_array
	end

	def players_current_score
		scores[current_score-1]
	end

	def games_for_score(n)
		score(n).reload.won_games
	end

	# Methods to write:

	# def serving

	# end

	# def points_played
	# 	array = []
	# end

	private

	def is_player_one_the_winner?
		won_after_eleven_points?(1, 2) || won_at_eleven_points?(1, 2)
  end

  def is_player_two_the_winner?
  	won_after_eleven_points?(2, 1) || won_at_eleven_points?(2, 1)
  end

	def won_at_eleven_points?(num1, num2)
		current_points_for_player(num1) == 11 && current_points_for_player(num2) < 10
	end

	def won_after_eleven_points?(num1, num2)
		current_points_for_player(num1) > 9 && current_points_for_player(num2) > 9 && current_points_for_player(num2) > (current_points_for_player(num1) + 1)
	end

end
