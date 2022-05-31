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
    # @weather.push(@output)

    render json: @output
    # render json: @output.as_json(only: ["current", "temp", "weather", "main", "description", "daily", "min", "max", "humidity", "wind_speed", "pop"])

    # respond_to do |format|
    #   format.json { render json: @weather.as_json }
    # end
  end
end
