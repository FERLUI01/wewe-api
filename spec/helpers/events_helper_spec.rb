require 'rails_helper'
include EventsHelper

RSpec.describe EventsHelper, type:  :helper do
    describe '#compute_clothes' do
        it 'returns warmest clothes as suggestion' do
            min_temp = 0   
            max_temp = 9
            expect(compute_clothes(min_temp, max_temp)).to eq('Wear warm clothes')
        end   
        it 'returns very warm clothes as suggestion' do
            min_temp = 5   
            max_temp = 15
            expect(compute_clothes(min_temp, max_temp)).to eq('Wear a jacket and a thick sweater')
        end   
        it 'returns warm clothes as suggestion' do
            min_temp = 9   
            max_temp = 18
            expect(compute_clothes(min_temp, max_temp)).to eq('Wear a jacket and a light sweater')
        end   
        it 'returns light clothing suggestion' do
            min_temp = 10   
            max_temp = 21
            expect(compute_clothes(min_temp, max_temp)).to eq('Wear light clothes and maybe a sweater')
        end   
        it 'returns lightest clothing suggestion' do
            min_temp = 20   
            max_temp = 21
            expect(compute_clothes(min_temp, max_temp)).to eq('Wear light clothes')
        end   
    end
end

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