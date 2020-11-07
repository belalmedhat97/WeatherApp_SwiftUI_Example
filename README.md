# WeatherApp_SwiftUI
Simple one screen Weather App using swiftui 
## API
I used online API that retreive weather Details of city or country every time i call it : http://www.weatherapi.com/ then by using codable decode JSON response and show Weather data
 
### Response

```
{
    "location": {
        "name": "Cairo",
        "region": "Al Qahirah",
        "country": "Egypt",
        "lat": 30.05,
        "lon": 31.25,
        "tz_id": "Africa/Cairo",
        "localtime_epoch": 1604752643,
        "localtime": "2020-11-07 14:37"
    },
    "current": {
        "last_updated_epoch": 1604751308,
        "last_updated": "2020-11-07 14:15",
        "temp_c": 24.0,
        "temp_f": 75.2,
        "is_day": 1,
        "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
        },
        "wind_mph": 8.1,
        "wind_kph": 13.0,
        "wind_degree": 230,
        "wind_dir": "SW",
        "pressure_mb": 1013.0,
        "pressure_in": 30.4,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 44,
        "cloud": 75,
        "feelslike_c": 25.3,
        "feelslike_f": 77.6,
        "vis_km": 10.0,
        "vis_miles": 6.0,
        "uv": 6.0,
        "gust_mph": 7.2,
        "gust_kph": 11.5
    }
}

```

### Gif

![](https://media.giphy.com/media/8Q6gdIk51m2apmWBqB/giphy.gif)
