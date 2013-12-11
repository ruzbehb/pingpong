require 'spec_helper'

describe Game do
	let(:score) { mock_model('Score') }
	let(:game) { Game.new(score: score) }

	context 'keeping track of scores' do

		it 'starts at zero' do
			expect(game.points).to eq 0
		end

		it "increments points" do
			game.award_point
			expect(game.points).to eq 1
		end
	end

	# it "knows when it's ended" do
	# 	allow(score).to receive(:game_won)

	# 	11.times { game.award_point }
	# 	expect(game.completed?).to be_true
	# end

	it "must have a number assigned to it" do
		game.number = nil
    expect(game).to have(1).error_on(:number)
    game.number = 1
    expect(game).to have(:no).errors_on(:number)
	end

	# it 'notifies the Score when the game finishes' do
	# 	expect(score).to receive(:game_won)

	# 	11.times { game.award_point }
	# end

	it "can delete a point" do
		game.points = 9
		game.award_point
		expect(game.points).to eq 10
		game.delete_point
		expect(game.points).to eq 9
	end

	it "does nothing if deleting a point at 0" do
		game.points = 0
		game.delete_point
		expect(game.points).to eq 0
	end

	it "let's match know a point has been added" do
		game.award_point
		expect(:match_.to receive(:point_change))
	end

	it "let's match know a point has been deleted" do
		game.delete_point
		expect(:match_.to receive(:point_change))

	end



end