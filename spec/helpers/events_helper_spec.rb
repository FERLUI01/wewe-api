require 'rails_helper'
include EventsHelper

RSpec.describe EventsHelper, type:  :helper do
    describe '#rain_clothes' do
        it 'returns that no rain expected' do
            rain_chance = 0
            expect(rain_clothes(rain_chance)).to eq('No rain expected today')
        end
        it 'returns suggestion for rain clothes when high chance of rain' do
            rain_chance = 89
            expect(rain_clothes(rain_chance)).to eq('High chance of rain today, take your rain jacket and umbrella')
        end
        it 'returns suggestion for rain clothes when raining' do
            rain_chance = 90
            expect(rain_clothes(rain_chance)).to eq('Take your rain jacket and umbrella')
        end
    end    
end