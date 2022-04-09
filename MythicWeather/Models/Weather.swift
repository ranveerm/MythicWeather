//
//  Weather.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation
import CoreLocation

/**
 Weather model as described in [Fields in API response](https://openweathermap.org/weather-data)
 - Todo:
 1. Add rain and clouds properties
 2. Make the object conform to `Codable`. Currently this is not possible a property within object is of type `CLLocationCoordinate2D`, which does not conform to `Codable`
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct Weather: Identifiable {
    let id: Int
    let date: Date
    let name: String
    let coordinates: CLLocationCoordinate2D
    
    let weatherMetrics: WeatherMetrics
    let wind: Wind
    let weatherConditions: [WeatherConditions]
    
    enum CodingKeys: String, CodingKey {
        case id, name, wind
        
        case date = "dt"
        case coordinates = "coord"
        case weatherMetrics = "main"
        case weatherConditions = "weather"
    }
}

// MARK: Protocol Conformances
extension Weather: Equatable { }

extension Weather: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(Int.self, forKey: .id)
        self.date = try values.decode(Date.self, forKey: .date)
        self.name = try values.decode(String.self, forKey: .name)
        
        self.coordinates = try values.decode(CLLocationCoordinate2D.self, forKey: .coordinates)
        
        self.weatherMetrics = try values.decode(WeatherMetrics.self, forKey: .weatherMetrics)
        self.wind = try values.decode(Wind.self, forKey: .wind)
        self.weatherConditions = try values.decode([WeatherConditions].self, forKey: .weatherConditions)
    }
}

// MARK: Stub
extension Weather {
    static let stub =  Weather(id: 2208791,
                               date: Date(timeIntervalSince1970: TimeInterval(1485784982)),
                               name: "Yafran",
                               coordinates: CLLocationCoordinate2D(latitude: 32.06329, longitude: 12.52859),
                               weatherMetrics: .stub, wind: .stub,
                               weatherConditions: [.stub])
}
