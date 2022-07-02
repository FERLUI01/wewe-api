# WeWe - Wearing based on the weather 🌦

An API built on Ruby on Rails that provides recommendations for what to wear according to the weather forecast on a specific location.

# Description ℹ️

Assuming that the user knows his location in geographical coordinates (e.g. via mobile phone or web browser), the API provides an endpoint that will show the current weather forecast for the inputted location. Also, and according to that current forecast, it will give recommendations on what type of clothes the user should take.
This solution is making use of an external API to retrieve the current meteorology: [OpenWeatherAPI](https://openweathermap.org/api/one-call-api)

# Technologies 💻

* *Ruby*: 3.0.3
* *Rails*: 6.1.6

# API 🌍

## *GET* /api/weather

### Query Parameters (required):
| Params | Description          | Type  |
|--------|----------------------|-------|
| lat    | Latitude in degrees  | float |
| lon    | Longitude in degrees | float |

### Response Body (examples):

#### *HTTP* 200:

{
  "lat": 50.9375,                  in celsius,
  "lon": 6.9603,                   in celsius,
  "current_temp": 15.47,           in celsius,
  "weather": "Clear",
  "weather_description": "clear sky",
  "feels_like": 14.98,             in celsius,
  "wind_speed": 0.51,              in m/s,
  "humidity": 73,                  percentage,
  "min_temp": 12.7,                in celsius,
  "max_temp": 21.5,                in celsius,
  "rain_chance": 100,              percentage,
  "recommended_clothing": "Wear light clothes and maybe a sweater",
  "suggestion": "Take your rain jacket and umbrella"
}

#### *HTTP* 4xx/500:

{
  "error": "client/server error message"
}

# How to run ⚡️
To run this app please execute the following commands in the project's root:

1. install gem dependencies:

bundle install

2. run rails server in port 3000:

rails s

## Tests 🧪
To run all the tests:

rspec

# Todo(s) 🔧
* Create a UI to display the weather info
* Extend the API: e.g. get the hourly day/week forecast