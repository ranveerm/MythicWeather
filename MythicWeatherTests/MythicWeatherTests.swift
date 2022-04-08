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
    let jsonResponse = """
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
    let expectedWeatherAPIResponse = WeatherAPIResponse(id: 2208791,
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
    
    func test_CLLocationCoordinate2DEquatableConformance() throws {
        /// Given
        let baseCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        /// When
        let identicalToBaseCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let differentToBaseCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 0)
        let differentToBaseCoordinateAlt = CLLocationCoordinate2D(latitude: 0, longitude: 1)
        
        /// Then
        XCTAssertEqual(baseCoordinate, identicalToBaseCoordinate)
        XCTAssertNotEqual(baseCoordinate, differentToBaseCoordinate)
        XCTAssertNotEqual(baseCoordinate, differentToBaseCoordinateAlt)
    }
    
    func test_decodeWeatherAPIResponse() throws {
        /// Given `expectedWeatherAPIResponse` and `jsonResponse`
        let jsonResponseData = jsonResponse.data(using: .utf8)!
        
        /// When
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let compoutedWeatherAPIResponse = try decoder.decode(WeatherAPIResponse.self, from: jsonResponseData)
        
        /// Then
        XCTAssertEqual(expectedWeatherAPIResponse, compoutedWeatherAPIResponse)
    }
}
