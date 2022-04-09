//
//  Double.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import Foundation

extension Double {
    /**
     Usable for metrics that need to be displayed to the user. Values are rounded to 2 decimal places
     - Note: This is a generalised representation form. It might not be appropriate for all metrics to be displayed with 2 decimal places.
     - Author: [ranveerm](https://github.com/ranveerm) 👨🏾‍💻
     */
    var metricDisplayRepresentation: String {
        String(format: "%.2f", self)
    }
}
