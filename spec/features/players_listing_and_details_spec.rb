require 'spec_helper'

describe 'listing all players in the database' do

	context 'user logged in' do

		before do
			login_as FactoryGirl.create(:player1)
		end

		it 'will show users own profile on top of the page' do


		end

		it 'will list all the players in the database' do

		end

	end

	context 'no user signed in' do

		it 'will list all the players in the database' do

		end

	end

end