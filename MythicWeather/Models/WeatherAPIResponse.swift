//
//  WeatherAPIResponse.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation
import CoreLocation

/**
 Weather metrics as described in [Fields in API response](https://openweathermap.org/weather-data)
 - Todo:
 1. Add rain and clouds properties
 2. Make the object conform to `Codable`. Currently this is not possible a property within object is of type `CLLocationCoordinate2D`, which does not conform to `Codable`
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct WeatherAPIResponse {
    let id: Int
    let date: Date
    let name: String
    let coordinates: CLLocationCoordinate2D
    
    let weatherMetrics: WeatherMetrics
    let weatherConditions: [WeatherConditions]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        
        case date = "dt"
        case coordinates = "coord"
        case weatherMetrics = "main"
        case weatherConditions = "weather"
    }
}

// MARK: Protocol Conformances
extension WeatherAPIResponse: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(Int.self, forKey: .id)
        self.date = try values.decode(Date.self, forKey: .date)
        self.name = try values.decode(String.self, forKey: .name)
        
        self.coordinates = .init(latitude: 0, longitude: 0)
        
        self.weatherMetrics = try values.decode(WeatherMetrics.self, forKey: .weatherMetrics)
        self.weatherConditions = try values.decode([WeatherConditions].self, forKey: .weatherConditions)
    }
}
