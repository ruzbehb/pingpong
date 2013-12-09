require 'spec_helper'

describe Score do

	# before do
	# 	player1 = create(:player, id: 1, email: "nat@esk.com")
	# 	player2 = create(:player, id: 2, email: "will@bell.com")
		
	# end
  
	it {should belong_to :match}
	it {should belong_to :player}

	it "knows to add a point" do
		# expect(player.)
		player.wins_point
		# expect()
	end

	it "knows to add a game at 11 points" do
	end

	it "knows to add a game when one player's points is greater than 10 and 2 more than the other player" do
	end


	it "knows to add a match at 2-1" do

	end

	it "knows to add a match at 2-0" do
	end

	it "knows when a match is over" do
	end

	it "knows it has an opponent" do
	end



end
