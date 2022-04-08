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
}
