require 'rails_helper'

describe 'get states route', type: :request do
  State.destroy_all
  FactoryBot.create_list(:state, 20)

  before { get '/states'}

  it 'returns all states' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end
