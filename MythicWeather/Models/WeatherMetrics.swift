//
//  WeatherMetrics.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation

/**
 Weather metrics as described in [Fields in API response](https://openweathermap.org/weather-data)
 - Important: Only the temperature filed (as defined by `temp` property) is essential for this object to exist. All other fields can be optional.
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct WeatherMetrics: Codable, Equatable {
    let temp: Double
    let tempMin: Double?
    let tempMax: Double?
    
    let pressure: Double?
    let seaLevel: Double?
    let grndLevel: Double?
    let humidity: Double?
}
