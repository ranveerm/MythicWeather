//
//  RainData.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 9/4/2022.
//

import Foundation

/**
 Rain metrics as described in [Fields in API response](https://openweathermap.org/weather-data)
 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct RainData: Equatable, Decodable {
    let oneHour: Double?
    let threeHours: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
        case threeHours = "3h"
    }
}

// MARK: Stub
extension RainData {
    static let stub = RainData(oneHour: nil, threeHours: 0.255)
}
