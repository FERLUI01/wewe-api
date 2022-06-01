class WeatherController < ApplicationController
  def location
    @lat = params[:lat]
    @lon = params[:lon]

    require 'net/http'
    require 'json'

    @url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{@lat}&lon=#{@lon}&units=metric&exclude=minutely,hourly,alerts&appid=ecd1d928cecc524245b088ed57bc6b99"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # Getting the first day out of the seven returned by openweathermap
    @current_day = @output['daily'].first

    # Returning daily weather forecast
    @daily_weather = {
      lat: @output['lat'],
      lon: @output['lon'],
      current_temp: @output['current']['temp'],
      weather: @output['current']['weather'].first['main'],
      weather_description: @output['current']['weather'].first['description'],
      feels_like: @output['current']['feels_like'],
      wind_speed: @output['current']['wind_speed'],
      humidity: @output ['current']['humidity'],
      min_temp: @current_day['temp']['min'],
      max_temp: @current_day['temp']['max'],
      rain_chance: @current_day['pop']
    }

    render json: @daily_weather
  end
end
