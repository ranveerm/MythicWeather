//
//  CoreLocation++.swift
//  MythicWeather
//
//  Created by Ranveer Mamidpelliwar on 8/4/2022.
//

import CoreLocation

/// Important: `Equatable` conformance for `CLLocationCoordinate2D` is provided below. This conformance is trivial and satisfies the need of the current project. However, if the scope of the project increases and this object is used in a different context, the below conformance needs to be reconsidered.
extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.longitude == rhs.longitude && lhs.latitude == rhs.latitude
    }
}

extension CLLocationCoordinate2D: Decodable {
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let latitude = try values.decode(Double.self, forKey: .latitude)
        let longitude = try values.decode(Double.self, forKey: .longitude)
        
        self.init(latitude: latitude, longitude: longitude)
    }
}
