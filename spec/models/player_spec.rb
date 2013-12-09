require 'spec_helper'

describe Player do
  
	it {should have_many :scores}
	it {should have_and_belong_to_many :matches}

	it "knows it's won" do
	end

	it "knows it's lost" do
	end

	it "has a name" do
	end

	it "can be linked to a profile" do
	end

	it "knows its score for a particular game" do
	end

	it "knows it's serving" do
	end

	it "knows which end it's playing" do
	end

	it "should have an opponent" do
	end



end
