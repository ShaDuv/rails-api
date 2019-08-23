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

    it 'creates a new state' do
      expect(State.count).to eq(1)
      state = State.all[0]
      expect(state.name).to eq(name)
    end
  end
  it 'returns the created state' do
    body = JSON.parse(response.body)
    state = State.all[0]
    expect(body["id"]).to eq(state.id)
    expect(body["name"]).to eq(state.name)
  end
end
