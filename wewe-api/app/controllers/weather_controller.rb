class WeatherController < ApplicationController
  def location
    @location_query = params[:city]

    # Extracting Lat and Lon from API
    require 'net/http'
    require 'json'

    @url = "https://api.openweathermap.org/geo/1.0/direct?q=#{@location_query}&limit=5&appid=ecd1d928cecc524245b088ed57bc6b99"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    # Passing Lat and Lon to Weather
    @weather = []

    @output.each do |loc|
      @url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{loc['lat']}&lon=#{loc['lon']}&units=metric&exclude=minutely,hourly,alerts&appid=ecd1d928cecc524245b088ed57bc6b99"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output2 = JSON.parse(@response)
      @weather.push(@output2)
    end

    render json: @weather.as_json(only: ["current", "temp", "weather", "main", "description", "daily", "min", "max", "humidity", "wind_speed", "pop"])

    # respond_to do |format|
    #   format.json { render json: @weather.as_json }
    # end
  end
end
