class WeatherController < ApplicationController
  def location
    lat = params[:lat]
    lon = params[:lon]

    # Validate params input
    return render json: { error: 'no valid lat/lon params' }, status: 400 unless lat.present? && lon.present?

    require 'net/http'
    require 'json'

    url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&units=metric&exclude=minutely,hourly,alerts&appid=ecd1d928cecc524245b088ed57bc6b99"
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    # Validate server response
    return render json: { error: 'api call failed' }, status: 500 unless response.is_a?(Net::HTTPSuccess)

    output = JSON.parse(response.body)

    # Getting the first day out of the seven returned by openweathermap
    current_day = output['daily'].first
    
    min_temp = current_day['temp']['min']
    max_temp = current_day['temp']['max']

    # Returning daily weather forecast
    daily_weather = {
      lat: output['lat'],
      lon: output['lon'],
      current_temp: output['current']['temp'],
      weather: output['current']['weather'].first['main'],
      weather_description: output['current']['weather'].first['description'],
      feels_like: output['current']['feels_like'],
      wind_speed: output['current']['wind_speed'],
      humidity: output ['current']['humidity'],
      min_temp: min_temp,
      max_temp: max_temp,
      rain_chance: current_day['pop'] * 100,
      recommended_clothing: if min_temp <= 5 && max_temp <= 10
                              'Wear warm clothes'
                            elsif min_temp <= 10 && max_temp <= 15
                              'Wear a jacket and a thick sweater'
                            elsif min_temp <= 10 && max_temp >= 15
                              'Wear a jacket and a light sweater'
                            elsif min_temp >= 10 && max_temp <= 20
                              'Take a sweater'
                            elsif min_temp <= 20 && max_temp >= 20
                              'Wear light clothes and maybe a sweater'
                            elsif min_temp >= 20 && max_temp >= 20
                              'Wear light clothes'
                            end
    }

    render json: daily_weather
  end
end
