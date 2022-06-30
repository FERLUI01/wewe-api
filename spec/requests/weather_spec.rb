require 'rails_helper'

RSpec.describe "Api::WeatherController", type: :request do
    describe "GET /api/weather" do
        context 'when the request is valid' do
            before { get '/api/weather', params: {lat: '50.937531', lon: '6.960279'} }
            it 'is a success' do
                expect(response).to have_http_status(200)
            end
            it "returns daily weather" do
                res = JSON.parse(response.body)
                expect(res).not_to be_empty
                # Current temperature
                expect(res.keys).to include(
                    'current_temp',
                    'min_temp',
                    'max_temp',
                    'recommended_clothing',
                    'wind_speed',
                    'rain_chance',
                    'humidity',
                )
                expect(res['current_temp']).to be_a(Float)
                # Min
                expect(res['min_temp']).to be_a(Float)
                # Max
                expect(res['max_temp']).to be_a(Float)
                # Recommended Clothing
                expect(res['recommended_clothing']).to be_a(String)
                # Wind
                expect(res['wind_speed']).to be_a(Float)
                # Rain
                expect(res['rain_chance']).to be_an(Integer)
                # Humidity
                expect(res['humidity']).to be_an(Integer)
            end  
        end
        context "when the request has no parameters" do
            before { get '/api/weather' }
            it 'returns status code 400' do
                expect(response).to have_http_status(400)   
            end
            it "returns a failure message" do
                expect(response.body).to include ("no valid lat/lon params")
            end    
        end
        context 'when the request is invalid' do
            before { get '/api/weather', params: {lat: '1221', lon: '1221'} }
            it 'returns status code 4xx' do
                expect(response.status).to be >= 400
            end
            it 'returns a failure message' do
                res = JSON.parse(response.body)
                expect(res.keys).to contain_exactly('error')
            end
        end    
    end       
end
