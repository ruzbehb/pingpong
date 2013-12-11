require 'spec_helper'

describe Score do

	let(:match) {mock_model('Match')}
	let(:score) {Score.create(match: match)}

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

	it "knows to finish match after 2 wins" do
		score.game_won
		allow(match).to receive(:find_winner)
		score.game_won
		expect(score.match_finished?).to be_true
	end

	it "knows not to finish match at 1-1" do
		expect(score.match_finished?).to be_false
		score.game_won
	end

	it "lets the match know it's over" do
		score.game_won
		expect(match).to receive(:find_winner)
		score.game_won
	end

	it "counts won games" do
		expect(score.won_games).to eq 0
		score.game_won
		expect(score.won_games).to eq 1
	end

end
