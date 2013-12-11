require 'spec_helper'

describe 'starting a match' do
  
  context 'starting match' do
    it 'should let you enter your name' do
      visit new_match_path
      expect(page).to have_content 'Player 1 name:'
    end

    it 'should show your name on scorer' do
    	visit new_match_path
    	fill_in 'Player 1 name:', with: 'Natalie'
    	fill_in 'Player 2 name:', with: 'Will'
    	click_button 'Start match!'
    	expect(page).to have_content 'Natalie'
    end

  end
end