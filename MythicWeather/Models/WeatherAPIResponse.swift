//
//  WeatherAPIResponse.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation

/**
 Object to model JSON data from API response. See https://testapi.io/api/olestang/weather/list for an example.

 - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
 */
struct WeatherAPIResponse: Decodable, Equatable {
    let responseCode: String
    let calculatedTime: Double
    let count: Int
    let weatherItems: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "cod"
        case calculatedTime = "calctime"
        case count = "cnt"
        case weatherItems = "list"
    }
}
