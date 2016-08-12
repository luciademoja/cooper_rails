require 'rails_helper'

describe 'Performance Data' do
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  describe 'POST /api/v1/data/' do
    it 'creates a data entry' do
      post '/api/v1/data/', {performance_data: {data: {message: 'Average'}}}, headers
      entry = PerformanceData.last
      expect(entry.data).to eq({'message'=>'Average'})
    end

  end
end
