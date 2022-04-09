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
enum WeatherType: String, Codable, CaseIterable, Equatable {
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case snow = "Snow"
    case atmosphere = "Atmosphere"
    case clear = "Clear"
    case clouds = "Clouds"
}

extension WeatherType {
    func customIcons() -> String {
        switch self {
        case .thunderstorm: return "⛈"
        case .drizzle: return "🌧"
        case .rain: return "☔️"
        case .snow: return "❄️"
        case .atmosphere: return "☄️"
        case .clear: return "☀️"
        case .clouds: return "☁️"
        }
    }
}
