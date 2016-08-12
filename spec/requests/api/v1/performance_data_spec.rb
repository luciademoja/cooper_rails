require 'rails_helper'

describe 'Performance Data' do
  let(:current_user) { FactoryGirl.create(:user) }
  let(:credentials) { current_user.create_new_auth_token }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }

  describe 'POST /api/v1/data/' do
    it 'creates a data entry' do
      post '/api/v1/data/', {params: {performance_data: {data: {message: 'Average'}}},
                            headers: headers.merge!(credentials)}
      entry = PerformanceData.last
      expect(entry.data).to eq({'message' => 'Average'})
    end

  end
end
