require 'spec_helper'

describe 'listing all players in the database' do

	before do
			@player1 = FactoryGirl.create(:player1)
			@player2 = FactoryGirl.create(:player2)
	end

	context 'user logged in' do

		before do
			login_as @player1
		end

		it 'will show users own profile on top of the page' do
			visit players_path
			expect(page).to have_content "Ruzbeh Bacha-ta"
		end

		it 'will list all the players in the database' do
			visit players_path
			expect(page).to have_content "Will Bill"

		end

	end

	context 'no user signed in' do

		it 'will list all the players in the database' do
			visit players_path
			expect(page).to have_content "Will Bill"
		end

	end

	context 'player profile' do

		it 'lists the correct player profile' do
			visit players_path
			click_on "Ruzbeh"
			expect(page).to have_content "Ruzbeh Bacha-ta"
		end

	end

end