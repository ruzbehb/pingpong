require 'spec_helper'

describe Match do

	let (:match) {Match.new}
	let (:player1) {mock_model('Player')}
	let (:player2) {mock_model('Player')}

	it {should have_many :scores}
	it {should have_and_belong_to_many :players}
	it {should have_many(:games).through(:scores)}

	# def game_number
	# 	match.score.game.number
	# end

	# def score_for player
	# 	game_number.player
	# end

	it "has 2 players" do
		expect(match.players.count).to eq 2 
	end

	it "has a winner" do
		expect(match.winner).not_to be_nil
	end
	
	xit "knows who's won" do
		
	end

	xit "knows the current score" do
		game_number = 1
		expect(score_for(player1)).to eq 
	end

	xit "has only two scores" do
		expect(match.scores.count).to eq 2
	end

	xit "has only two players" do
		expect(match.players.count).to eq 2
	end

	xit "knows which score belongs to which player" do
		expect(match.scores.player).to eq 
		expect(match.scores.player).to eq


	end


end