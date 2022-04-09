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
struct Wind: Equatable {
    let speed: Double
    /// Meteorological Degrees. Note that this object can be represented by a `Double` to reduce complexity, but this is not aligned with it's real-world phenomenon.
    let direction: Measurement<UnitAngle>
    
    enum CodingKeys: String, CodingKey {
        case speed
        case direction = "deg"
    }
}

// MARK: Protocol Conformances
extension Wind: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.speed = try values.decode(Double.self, forKey: .speed)
        let directionRaw = try values.decode(Double.self, forKey: .direction)
        self.direction = .init(value: directionRaw, unit: .degrees)
    }
}

// MARK: Stub
extension Wind {
    static let stub = Wind(speed: 3.96, direction: .init(value: 356.5, unit: .degrees))
}
