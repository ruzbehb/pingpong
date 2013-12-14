require 'spec_helper'

describe 'manage a list of clubs with map' do
	
	before do
		FactoryGirl.create(:club)
	end

	context 'listing of clubs' do
		
		it 'lists all the clubs from the database' do
			visit clubs_path
			expect(page).to have_content "Finsbury"
		end
	
	end

end