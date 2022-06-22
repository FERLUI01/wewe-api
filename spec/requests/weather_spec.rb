require 'rails_helper'

RSpec.describe "Api::WeatherController", type: :request do
    describe "GET /api/weather" do
        # make HTTP get request before each eaxmple
        before { get '/api/weather' }
        it "returns weather" do
            expect(response.body).not_to be_empty
        end  
        context "when the request is invalid" do
            it 'returns status code 400' do
                expect(response).to have_http_status(400)   
                # expect(json.size).to eq(5)
            end
            it "returns a failure message" do
                expect(response.body).to include ("no valid lat/lon params")
            end    
        end
    end       
end
