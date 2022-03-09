require 'rails_helper'

RSpec.describe 'Fourteener API' do
  it 'happy path - finds all fourteeners' do
    mtn1 = create(:fourteener)
    mtn2 = create(:fourteener)
    mtn3 = create(:fourteener)

    get "/api/v1/fourteeners"

    expect(response).to be_successful

    mountains = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(mountains.count).to eq(3)

    mountains.each do |mountain|
      expect(mountain[:type]).to eq("fourteeners")
      expect(mountain[:attributes][:english_name]).to be_a(String)
      expect(mountain[:attributes][:elevation]).to be_an(Integer)
    end
  end

  it 'happy path - finds one fourteener' do
    mtn1 = create(:fourteener)
    mtn2 = create(:fourteener)
    mtn3 = create(:fourteener)

    get "/api/v1/fourteeners/#{mtn1.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    mountain = (JSON.parse(response.body, symbolize_names: true))[:data]

    expect(mountain[:attributes][:english_name]).to eq(mtn1.english_name)
    expect(mountain[:attributes][:elevation]).to eq(mtn1.elevation)
    expect(mountain[:attributes][:english_name]).to_not eq(mtn2.english_name)
    expect(mountain[:attributes][:english_name]).to_not eq(mtn3.english_name)
  end

  it 'sad path - finds one fourteener' do
    get "/api/v1/fourteeners/10000000"

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(error).to eq("There was an error finding this mountain.")
  end

  it 'happy path - updates a fourteener' do
    mtn1 = create(:fourteener)

    params = {
      arapahoe_name: mtn1.arapahoe_name,
      arapahoe_translation: mtn1.arapahoe_translation,
      ute_name: mtn1.ute_name,
      ute_translation: mtn1.ute_translation,
      elevation: 14001,
      range: mtn1.range,
      county: 'Jefferson County',
      nearby_towns: mtn1.nearby_towns,
      hiking_routes: mtn1.hiking_routes,
      climate: mtn1.climate,
      geology: mtn1.geology,
      first_ascent: "Jane Tanaka, 1927",
      history: mtn1.history,
      resources: mtn1.resources,
      image: mtn1.image,
      map: mtn1.map
    }
    header = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/fourteeners/#{mtn1.id}", headers: header, params: JSON.generate(params)

    expect(response.status).to eq(200)

    mountain = Fourteener.find_by(id: mtn1)

    expect(mountain.elevation).to eq(14001)
    expect(mountain.county).to eq("Jefferson County")
    expect(mountain.first_ascent).to eq("Jane Tanaka, 1927")
  end

  it 'sad path - updates a fourteener' do
    mtn1 = create(:fourteener)

    params = {
      arapahoe_name: mtn1.arapahoe_name,
      arapahoe_translation: mtn1.arapahoe_translation,
      ute_name: mtn1.ute_name,
      ute_translation: mtn1.ute_translation,
      elevation: "",
      range: mtn1.range,
      county: 'Jefferson County',
      nearby_towns: mtn1.nearby_towns,
      hiking_routes: mtn1.hiking_routes,
      climate: mtn1.climate,
      geology: mtn1.geology,
      first_ascent: "Jane Tanaka, 1927",
      history: mtn1.history,
      resources: mtn1.resources,
      image: mtn1.image,
      map: mtn1.map
    }

    header = {"CONTENT_TYPE" => "application/json"}
    
    patch "/api/v1/fourteeners/#{mtn1.id}", headers: header, params: JSON.generate(params)

    expect(response.status).to eq(400)

    error = (JSON.parse(response.body, symbolize_names: true))[:errors][:details]

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(error).to eq("There was an error updating this mountain's details.")
  end
end
