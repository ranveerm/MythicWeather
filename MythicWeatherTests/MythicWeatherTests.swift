//
//  MythicWeatherTests.swift
//  MythicWeatherTests
//
//  Created by Ranveer Mamidpelliwar on 7/4/2022.
//

import XCTest
import CoreLocation
@testable import MythicWeather

class MythicWeatherTests: XCTestCase {
    var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    let jsonWeatherObjet = """
{
  "id": 2208791,
  "name": "Yafran",
  "coord": {
    "lon": 12.52859,
    "lat": 32.06329
  },
  "main": {
    "temp": 9.68,
    "temp_min": 9.681,
    "temp_max": 9.681,
    "pressure": 961.02,
    "sea_level": 1036.82,
    "grnd_level": 961.02,
    "humidity": 85
  },
  "dt": 1485784982,
  "wind": {
    "speed": 3.96,
    "deg": 356.5
  },
  "rain": {
    "3h": 0.255
  },
  "clouds": {
    "all": 88
  },
  "weather": [
    {
      "id": 500,
      "main": "Rain",
      "description": "light rain",
      "icon": "10d"
    }
  ],
  "sys": {
    "type": 1,
    "id": 8166,
    "message": 0.2064,
    "country": "AU",
    "sunrise": 1485840694,
    "sunset": 1485891062
  }
}
"""
    
    let expectedWeather = Weather(id: 2208791,
                                  date: Date(timeIntervalSince1970: TimeInterval(1485784982)),
                                  name: "Yafran",
                                  coordinates: CLLocationCoordinate2D(latitude: 32.06329, longitude: 12.52859),
                                  weatherMetrics: WeatherMetrics(temp: 9.68,
                                                                 tempMin: 9.681, tempMax: 9.681,
                                                                 pressure: 961.02,
                                                                 seaLevel: 1036.82,
                                                                 grndLevel: 961.02, humidity: 85),
                                  weatherConditions: [
                                    WeatherConditions(id: 500, type: .rain, description: "light rain", icon: "10d")
                                  ])
    
    let jsonWeatherAPIReponse = """
{
  "cod": "200",
  "calctime": 0.3107,
  "cnt": 1,
  "list": [
    {
      "id": 2208791,
      "name": "Yafran",
      "coord": {
        "lon": 12.52859,
        "lat": 32.06329
      },
      "main": {
        "temp": 9.68,
        "temp_min": 9.681,
        "temp_max": 9.681,
        "pressure": 961.02,
        "sea_level": 1036.82,
        "grnd_level": 961.02,
        "humidity": 85
      },
      "dt": 1485784982,
      "wind": {
        "speed": 3.96,
        "deg": 356.5
      },
      "rain": {
        "3h": 0.255
      },
      "clouds": {
        "all": 88
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ]
    }
  ]
}
"""
    
    let expectedWeatherAPIResponse = WeatherAPIResponse(responseCode: "200", calculatedTime: 0.3107, count: 1,
                                                        weatherItems: [
                                                            Weather(id: 2208791,
                                                                    date: Date(timeIntervalSince1970: 1485784982),
                                                                    name: "Yafran",
                                                                    coordinates: CLLocationCoordinate2D(latitude: 32.06329, longitude: 12.52859), weatherMetrics: WeatherMetrics(temp: 9.68, tempMin: 9.681, tempMax: 9.681, pressure: 961.02, seaLevel: 1036.82, grndLevel: 961.02, humidity: 85), weatherConditions: [
                                                                        WeatherConditions(id: 500, type: .rain, description: "light rain", icon: "10d")
                                                                    ])
                                                        ])
    
    func test_decodeWeatherFromJSON() throws {
        /// Given `expectedWeather` and `jsonResponse`
        let jsonWeatherObjetData = jsonWeatherObjet.data(using: .utf8)!
        
        /// When
        let compoutedWeather = try decoder.decode(Weather.self, from: jsonWeatherObjetData)
        
        /// Then
        XCTAssertEqual(expectedWeather, compoutedWeather)
    }
    
    func test_decodeWeatherAPIResponseFromJSON() throws {
        /// Given `expectedWeatherAPIResponse` and `jsonWeatherAPIReponse`
        let jsonWeatherAPIReponseData = jsonWeatherAPIReponse.data(using: .utf8)!
        
        /// When
        let compoutedWeatherAPIResponse = try decoder.decode(WeatherAPIResponse.self, from: jsonWeatherAPIReponseData)
        
        /// Then
        XCTAssertEqual(expectedWeatherAPIResponse, compoutedWeatherAPIResponse)
    }
}
