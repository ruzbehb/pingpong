require 'spec_helper'

describe 'Matches API' do

	context '/matches' do

    before(:all) do
      create_list(:match, 5)
      get '/api/matches', {}, 'HTTP_HOST' => 'api.example.com'

      @response, @json = response, JSON.parse(response.body)
    end

    it 'returns a success status code' do
      expect(@response).to be_success
    end

  end
	
end


    

   