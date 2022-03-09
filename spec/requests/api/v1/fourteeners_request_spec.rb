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
end
