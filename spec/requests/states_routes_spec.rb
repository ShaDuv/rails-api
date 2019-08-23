require 'rails_helper'

describe 'get states route', type: :request do
  State.destroy_all
  FactoryBot.create_list(:state, 20)

  before { get '/states'}

  it 'returns all states' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  describe 'post states route', type: :request do
    name = "Test State"
    before do
      State.destroy_all
      post '/states', params: { name: name }
    end
  end
end
