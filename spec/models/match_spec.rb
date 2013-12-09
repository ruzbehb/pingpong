require 'spec_helper'

describe Match do

	before do
		player1 = create(:player, id: 1, email: "nat@esk.com")
		player2 = create(:player, id: 2, email: "will@bell.com")
		
	end

	it {should have_many :scores}
	it {should have_and_belong_to_many :players}
	
	it "knows who's won" do
		match.player1.score.match_score = 0
		match.player2.score.match_score = 1
		expect(match.winner).to eq "player2"
	end

	it "knows its score" do
		match.player1.score.point_score = [2,11,3]
		match.player2.score.point_score = [11,5,11]
		match.player1.score.game_score = 1
		match.player2.score.game_score = 2
		match.player1.score.match_score = 0
		match.player2.score.match_score = 1

	end

	it "has only two scores" do
		expect(match.scores.count).to eq 2
	end

	it "has only two players" do
		expect(match.players.count).to eq 2

	end

	it "knows which score belongs to which player" do
	end


end