require 'spec_helper'

describe 'starting a match' do
  
  context 'guest starting match' do
    it 'should let you enter your name' do
      visit new_match_path
      expect(page).to have_content 'Player 1 name:'
    end
  end
end