require 'rails_helper'

describe 'get state_parks route', type: :request do
  let(:state) { FactoryBot.create(:state_with_parks) }
  before do
    get "/states/#{state.id}/parks"
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns all parks for the state with the given id' do
    expect(JSON.parse(response.body).size).to eq(state.parks.count)
  end

end

describe 'post state_parks route', type: :request do
  let!(:state) { FactoryBot.create(:state) }
  let(:new_park) { { name: "Epic Park", address: "1234 Main", city: "Middle Of Nowhere!"} }

  before do
    post "/states/#{state.id}/parks", params: new_park
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'creates a new park' do
    expect(state.parks.count).to eq(1)
  end

  it 'returns the created park' do
    expect_json_to_eq_object(response, state.parks.first)
  end
end

describe 'get state_park route', type: :request do
  let(:state) { FactoryBot.create(:state_with_parks) }
  let(:park) { state.parks.first}
  it 'returns the park with the given id for the state with the given state_id' do
    get "/states/#{state.id}/parks/#{park.id}"
    expect_json_to_eq_object(response, state.parks.first)
  end
end

describe 'patch state_park route', type: :request do
  let(:state) { FactoryBot.create(:state_with_parks) }
  let(:park) { state.parks.first}
  let(:info) {{ name: "Slightly Less Epic Park",
                       address: "4321 Cow Patty Ave",
                       city: "Probably Portland"}}

  it 'updates the park with the given id for the state with the given state_id, using the given parameters' do
    patch "/states/#{state.id}/parks/#{park.id}", params: info
    updated_park = state.parks.find(park.id)
    expect(updated_park.name).to eq(info[:name])
    expect(updated_park.address).to eq(info[:address])
    expect(updated_park.city).to eq(info[:city])
  end
end

describe 'delete state_park route', type: :request do
  let(:state) { FactoryBot.create(:state_with_parks) }
  let!(:park) { state.parks.first}
  it 'destroys the park with the given id for the state with the given state_id' do
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
