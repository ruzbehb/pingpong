require 'spec_helper'

describe Match do

	let (:match) { Match.create }

	let (:player1) { match.players.first }
	let (:player2) { match.players.last }

	let (:score1) { match.scores.first }
	let (:score2) { match.scores.last }

	# let (:player1) { match.players.first }
	# let (:player1) { match.players.first }

	it {should have_many :scores}
	it {should have_and_belong_to_many :players}
	it {should have_many(:games).through(:scores)}

	def example_game(player, number)
		match.scores[player-1].games[number-1]
	end

	def complete_game
		example_game(1,1).points = 10
		example_game(2,1).points = 12
		match.point_change
		match.update_game_number
		example_game(1,2).points = 5
		example_game(2,2).points = 11
		match.point_change
	end

	it "has 2 players" do
		expect(match.players.count).to eq 2 
	end

	it "has 2 scores" do
		expect(match.scores.count).to eq 2
	end

	it "knows the match is over" do
		expect(match.find_winner).to eq 'game still in progress'
		complete_game
		expect(match.find_winner).not_to eq 'game still in progress'
	end

	it "lets the score know to start a new game" do
		expect(example_game(1,2)).to be_nil
		example_game(1,1).points = 10
		# puts example_game(1,1).points 
		example_game(2,1).points = 11
		# puts example_game(2,1).points 
		example_game(2,1).award_point	
		# puts example_game(2,1).points 
		# raise(example_game(2,1).points.inspect)
		expect(example_game(2,2)).not_to be_nil
		expect(example_game(1,2)).not_to be_nil
	end

	it "knows who the winner is" do
		complete_game
		expect(match.find_winner).to eq player2
	end

	it "knows which score belongs to which player" do
		expect(match.scores.first.player).to eq player1
		expect(match.scores.last.player).to eq player2
	end

	xit "knows which player belongs to which score" do
		expect(match.players.first.score).to eq score1
		expect(match.players.last.score).to eq score2
	end

	it "knows the current score" do
		complete_game
		expect(match.list_points_for(1)).to eq [10,5]
		expect(match.list_points_for(2)).to eq [12,11]
	end

	xit "knows who's serving" do
		expect(match.serving).to eq player1
	end

	context "updating progress" do

		xit "knows who's serving" do
		end

		xit "knows how many games each palyer has won" do
		end

		xit "knows the current points for each player" do
		end

	end

	xit "can connect guest to player profile" do

	end

end