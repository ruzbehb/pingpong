require 'spec_helper'

describe Score do

	let(:match) {mock_model('Match')}
	let(:player) {mock_model('Player')}
	let(:score) {Score.create(match: match, player: player)}
	let(:game) {mock_model('Game', :score => score, :points => 0, :number => 1)}

	it {should belong_to :match}
	it {should belong_to :player}
	it {should have_many :games}

	it "starts with a game" do
		expect(score.games.count).to eq 1
	end

	it "assigns a number to a game" do
		expect(score.games[0].number).to eq 1
		score.new_game
		expect(score.games[1].number).to eq 2
		score.new_game
		expect(score.games[2].number).to eq 3
	end

	it "can create a new game" do
		score.game_won
		expect(score.won_games).to eq 1
		expect(score.games.count).to eq 2
	end

	xit "knows to add a game at 11 points" do
	end

	xit "knows to add a game when one player's points is greater than 10 and 2 more than the other player" do
	end

	it "knows to finish match at 2-1" do
		@lost_games = 1
		@won_games = 2
		expect(score.match_finished?).to be_true
	end

	it "knows to finish match at 1-2" do
		@lost_games = 2
		@won_games = 1
		expect(score.match_finished?).to be_true
	end

	it "knows to finish match at 2-0" do
		@won_games = 2
		expect(score.match_finished?).to be_true
	end

	it "knows to finish match at 0-2" do
		@lost_games = 2
		expect(score.match_finished?).to be_true
	end

	it "lets the match know it's over" do
		
		score.game_won
		expect(match).to receive(:match_over)
		allow(player).to receive(:match_won)
		score.game_won
	end

	it "lets the player know it's won" do
		
		score.game_won
		allow(match).to receive(:match_over)
		expect(player).to receive(:match_won)
		score.game_won
	end

	it "lets the player know it's lost" do
		score.game_lost
		allow(match).to receive(:match_over)
		expect(player).to receive(:match_lost)
		score.game_lost
		
	end

	xit "knows it has an opponent" do
	end

	it "counts won games" do
		expect(score.won_games).to eq 0
		score.game_won
		expect(score.won_games).to eq 1
	end

end
