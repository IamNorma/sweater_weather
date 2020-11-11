# Sweater Weather

## About The Project

This project is an API based application. This repo exposes endpoints for an app that is used to plan road trips and provide forecasted weather for the final destination.

## Learning Goals

* Expose an API that contains data from multiple external APIs
* Expose an API that requires an authentication token (API key)
* Expose an API for user CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Endpoints

### Retrieve weather for a city

Example Request: `GET /api/v1/forecast?location=denver,co`

Example Response:
```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2020-11-11 04:36:10 -0700",
                "sunrise": "2020-11-11 06:40:40 -0700",
                "sunset": "2020-11-11 16:47:32 -0700",
                "temperature": 25.16,
                "feels_like": 15.75,
                "humidity": 62,
                "uvi": 2.47,
                "visibility": 10000,
                "conditions": "clear sky",
                "icon": "01n"
            },
            "daily_weather": [
                {
                    "date": "2020-11-11",
                    "sunrise": "2020-11-11 06:40:40 -0700",
                    "sunset": "2020-11-11 16:47:32 -0700",
                    "max_temp": 48.31,
                    "min_temp": 25.16,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2020-11-12",
                    "sunrise": "2020-11-12 06:41:49 -0700",
                    "sunset": "2020-11-12 16:46:39 -0700",
                    "max_temp": 45.61,
                    "min_temp": 33.89,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2020-11-13",
                    "sunrise": "2020-11-13 06:42:59 -0700",
                    "sunset": "2020-11-13 16:45:49 -0700",
                    "max_temp": 55.18,
                    "min_temp": 36.18,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2020-11-14",
                    "sunrise": "2020-11-14 06:44:08 -0700",
                    "sunset": "2020-11-14 16:45:00 -0700",
                    "max_temp": 59.76,
                    "min_temp": 39.76,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "date": "2020-11-15",
                    "sunrise": "2020-11-15 06:45:17 -0700",
                    "sunset": "2020-11-15 16:44:13 -0700",
                    "max_temp": 50.67,
                    "min_temp": 37.74,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": " 4:00:00",
                    "temperature": 25.16,
                    "wind_speed": "3.78 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 5:00:00",
                    "temperature": 29.05,
                    "wind_speed": "4.14 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 6:00:00",
                    "temperature": 31.19,
                    "wind_speed": "4.27 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": " 7:00:00",
                    "temperature": 32.18,
                    "wind_speed": "4.83 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": " 8:00:00",
                    "temperature": 34.2,
                    "wind_speed": "4.23 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": " 9:00:00",
                    "temperature": 37.04,
                    "wind_speed": "2.91 mph",
                    "wind_direction": "S",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "10:00:00",
                    "temperature": 39.96,
                    "wind_speed": "1.7 mph",
                    "wind_direction": "SSE",
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "11:00:00",
                    "temperature": 42.46,
                    "wind_speed": "2.68 mph",
                    "wind_direction": "E",
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
```
### Retrieve background image for the city

Example Request: `GET /api/v1/backgrounds?location=denver,co`

Example Response:

```
{
    "data": {
        "id": null,
        "type": "background",
        "attributes": {
            "location": "denver,co",
            "width": 6000,
            "height": 4000,
            "color": "#130E0B",
            "description": "Sleeping Owl",
            "author": {
                "name": "Joshua Forbes",
                "splash_profile": "https://unsplash.com/@joshua_forbes",
                "instagram_username": "joshua_forbes",
                "twitter_username": "JustJoshSA"
            },
            "urls": {
                "raw": "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MTM0OH0",
                "regular": "https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE4MTM0OH0"
            }
        }
    }
}
```
### User registration

Example Request:
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "hello@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example Response:

```
{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "hello@example.com",
            "api_key": "iw6Q26CxVtvH5UoXBc1d9e1qFoAq"
        }
    }
}
```
### User login

Example Request:
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "hello@example.com",
  "password": "password"
}
```

Example Response:

```
{
    "data": {
        "id": "3",
        "type": "users",
        "attributes": {
            "email": "hello@example.com",
            "api_key": "iw6Q26CxVtvH5UoXBc1d9e1qFoAq"
        }
    }
}
```

### Roadtrip planner

Example Request:
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "iw6Q26CxVtvH5UoXBc1d9e1qFoAq"
}
```

Example Response:

```
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "1h48m",
            "weather_at_eta": {
                "temperature": 30.83,
                "conditions": "scattered clouds"
            }
        }
    }
}
```

## Local Setup

* Ruby 2.5.3
* Rails 5.2.4.4

### Fork and clone repo
```
bundle install
rails db:create
bundle exec figaro install
bundle exec rspec
```
There should be 36 passing examples

### External APIs used

* [MapQuest's Geocoding and Directions API](https://developer.mapquest.com/documentation/geocoding-api/)
* [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
* [Unsplash API](https://unsplash.com/developers)

Place your keys in config/application.yml using the following format:

```
MAP_API_KEY: <your api key>
WEATHER_API_KEY: <your api key>
IMAGE_API_KEY: <your api key>
```
