require 'rails_helper'

describe 'get state_parks route', type: :request do
  before do
    state = FactoryBot.create(:state_with_parks)
    get "/states/#{state.id}/parks"
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns all parks for the state with the given id' do
    expect(JSON.parse(response.body).size).to eq(12)
  end

end

describe 'post state_parks route', type: :request do
  name = "Epic Park"
  address = "1234 Main"
  city = "Middle Of Nowhere!"
  state = FactoryBot.create(:state)
  park = nil

  before do
    post "/states/#{state.id}/parks", params: { name: name, address: address, city: city }
    state = State.find(state.id)
    park = state.parks[0]
  end

  it 'creates a new park' do
    expect(state.parks.count).to eq(1)
    expect(park.name).to eq(name)
    expect(park.address).to eq(address)
    expect(park.city).to eq(city)
  end

  it 'returns the created park' do
    expect_json_to_eq_object(response, park)
  end
end

describe 'get state_park route', type: :request do
  it 'returns the park with the given id for the state with the given state_id' do
    state = FactoryBot.create(:state_with_parks)
    park = state.parks[0]

    get "/states/#{state.id}/parks/#{park.id}"
    expect_json_to_eq_object(response, park)
  end
end

describe 'patch state_park route', type: :request do
  it 'updates the park with the given id for the state with the given state_id, using the given parameters' do
    state = FactoryBot.create(:state_with_parks)
    park = state.parks[0]
    name = "Slightly Less Epic Park"
    address = "4321 Cow Patty Ave"
    city = "Probably Portland"
    patch "/states/#{state.id}/parks/#{park.id}", params: { name: name, address: address, body: city, rating: new_rating }
    park = state.parks.find(park.id)
    expect(park.name).to eq(name)
    expect(park.address).to eq(address)
    expect(park.city).to eq(city)
  end
end

describe 'delete state_park route', type: :request do
  it 'destroys the park with the given id for the state with the given state_id' do
    state = FactoryBot.create(:state_with_parks)
    park = state.parks[0]
    delete "/states/#{state.id}/parks/#{park.id}"
    expect(response).to have_http_status(:success)
    get "/states/#{state.id}/parks/#{park.id}"
    expect(response).to have_http_status(:not_found)
  end
end

def expect_json_to_eq_object(json_response, park_object)
  body = JSON.parse(json_response.body)
  expect(body["name"]).to eq(park_object.name)
  expect(body["address"]).to eq(park_object.address)
  expect(body["city"]).to eq(park_object.city)
  expect(body["state_id"]).to eq(park_object.state_id)
end
