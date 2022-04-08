//
//  Wind.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation

/**
 Wind conditions as described in [Fields in API response](https://openweathermap.org/weather-data)
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct Wind: Codable {
    let speed: Double
    /// Meteorological Degrees. Note that this object can be represented by a `Double` to reduce complexity, but this is not aligned with it's real-world phenomenon.
    let direction: Measurement<UnitAngle>
    
    enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
    }
}
