require 'spec_helper'

describe Match do

	let (:match) { Match.create }

	let (:player1) { match.players.first }
	let (:player2) { match.players.last }

	it {should have_many :scores}
	# it {should have_and_belong_to_many :players}
	it {should have_many(:games).through(:scores)}

	before (:each) do
		match.add_players('Nat','Will')
	end

	def example_game(player, number)
		match.score(player).game(number)
	end

	def complete_game
		example_game(1,1).points = 9
		example_game(2,1).points = 11

		example_game(1,1).award_point
		example_game(2,1).award_point

		match.point_change
		match.score(2).game_won
		# match.update_oppositions_game_number

		match.scores.each(&:reload)
		example_game(1,2).points = 4
		example_game(2,2).points = 10

		example_game(1,2).award_point
		example_game(2,2).award_point

		match.point_change
		match.score(2).game_won
		match.scores.each(&:reload)
		# match.update_oppositions_game_number

	end

	it "has 2 players" do
		expect(match.players.count).to eq 2 
	end

	it "has 2 scores" do
		expect(match.scores.count).to eq 2
	end

	it "knows the match is over" do
		expect(match.find_winner).to eq nil
		complete_game
		expect(match.find_winner).not_to eq nil
		expect(match.over?).to be_true
	end

	it "lets the score know to start a new game" do
		expect(example_game(1,2)).to be_nil

		example_game(1,1).points = 9
		example_game(1,1).award_point
		match.score(1).game_won
		example_game(2,1).points = 11
		example_game(2,1).delete_point
		example_game(2,1).award_point
		example_game(2,1).award_point

		match.scores.each(&:reload)

		expect(example_game(2,2)).not_to be_nil
		expect(example_game(1,2)).not_to be_nil
	end

	it "knows which score belongs to which player" do
		expect(match.scores.first.player).to eq player1
		expect(match.scores.last.player).to eq player2
	end

	it "knows the current score" do
		complete_game
		expect(match.list_points_for(1)).to eq [10,5]
		expect(match.list_points_for(2)).to eq [12,11]
	end

	it "should update game number to 2 when 2 games won" do
		10.times {match.score(2).current_game.award_point}
		match.score(2).current_game.award_point
		match.score(2).game_won

		match.scores.each(&:reload)

		expect(match.score(1).won_games).to eq 0
		expect(match.score(2).won_games).to eq 1
		11.times {match.score(2).current_game.award_point}
		match.score(2).game_won


		match.scores.each(&:reload)
		
		expect(match.score(1).won_games).to eq 0
		expect(match.score(2).won_games).to eq 2
		expect(match.score(2).match_finished?).to be_true
	end

	it "knows the winner of each game" do
		complete_game
		expect(match.winner_of_game(1)).to eq "Will"
		expect(match.winner_of_game(2)).to eq "Will"
	end

	context "updating progress" do

		xit "knows who's serving" do
			expect(match.serving).to eq player1
			example_game(1,1).award_point
			example_game(1,1).award_point
			expect(match.serving).to eq player2
			example_game(2,1).award_point
			example_game(1,1).award_point
			expect(match.serving).to eq player1
		end

		it "knows who the winner is" do
			complete_game
			# puts match.find_winning_score
			expect(match.find_winner).to eq 'Will'
		end
	end

	

	xit "can connect guest to player profile" do

	end

end