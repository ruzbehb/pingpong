require 'spec_helper'

describe 'manage a list of clubs with map' do
	
	context 'listing of clubs' do
		
		it 'lists all the clubs from the database' do
			visit clubs_path
			expect(page).to have_content "Finsbury Table Tennis Club"
		end
	
	end

end