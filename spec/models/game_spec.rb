require 'spec_helper'

describe Game do
	let(:score) { mock_model('Score') }
	let(:game) { Game.new }

	context 'keeping track of scores' do

		it 'starts at zero' do
			expect(game.points).to eq 0
		end

		it "increments points" do
			game.award_point
			expect(game.points).to eq 1
		end
	end

	it "knows when it's ended" do
		11.times { game.award_point }
		expect(game.completed?).to be_true
	end

	it "must have a number assigned to it" do
		game.number = nil
    game.should have(1).error_on(:number)
    game.number = 1
    game.should have(:no).errors_on(:number)
	end

	it 'notifies the Score when the game finishes' do
		game = Game.new(score: score)
	end

end