//
//  WeatherType.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 7/4/2022.
//

import Foundation

/**
 Specify combination of all weather types returned by API
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
enum WeatherType: String, Codable, CaseIterable {
    case thunderstorm
    case drizzle
    case rain
    case snow
    case atmosphere
    case clear
    case clouds
}
