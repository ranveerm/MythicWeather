//
//  WeatherConditions.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 7/4/2022.
//

import Foundation

/**
 Weather condition as described in [Weather Conditions](https://openweathermap.org/weather-conditions)
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct WeatherConditions: Codable, Equatable {
    let id: Int
    let type: WeatherType
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, icon
        
        case type = "main"
    }
}

// MARK: Stub
extension WeatherConditions {
    static let stub = WeatherConditions(id: 500, type: .rain, description: "light rain", icon: "10d")
}
