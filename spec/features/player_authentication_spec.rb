require 'spec_helper'

describe 'player authentication' do

	context 'player registration' do

		it 'starts a player session after the player registers' do
			visit '/'
			click_on 'Register'
			fill_in 'Email', with: 'helloworld@gmail.com'
			fill_in 'Password', with: '12345678'
			fill_in 'Password confirmation', with: '12345678'
			click_button 'Sign up'
			expect(page).to have_content 'helloworld@gmail.com'
		end

	end

	context 'player signs in' do

		before do
			FactoryGirl.create(:player)
		end

		it 'starts a player session after the player signs in' do
			visit '/'
			click_on 'Login'
			fill_in 'Email', with: 'helloworld@gmail.com'
			fill_in 'Password', with: '12345678'
			click_button 'Sign in'
			expect(page).to have_content 'helloworld@gmail.com'
		end

	end

	context 'player logs out' do

		before do
			login_as FactoryGirl.create(:player)
		end

		it 'kills the player session after player signs out' do
			visit '/'
			expect(page).to have_content 'helloworld@gmail.com'
			click_on 'Logout'
			visit '/'
			expect(page).to_not have_content 'helloworld@gmail.com'
		end

	end


end