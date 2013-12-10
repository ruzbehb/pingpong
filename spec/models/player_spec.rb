require 'spec_helper'

describe Player do
  
	it {should have_many :scores}
	it {should have_and_belong_to_many :matches}

	xit "knows it's won" do
	end

	xit "knows it's lost" do
	end

	xit "has a name" do
	end

	xit "can be linked to a profile" do
	end

	xit "knows its score for a particular game" do
	end

	xit "knows it's serving" do
	end

	xit "knows which end it's playing" do
	end

	xit "should have an opponent" do
	end



end
