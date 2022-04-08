//
//  MythicWeatherTests.swift
//  MythicWeatherTests
//
//  Created by Ranveer Mamidpelliwar on 7/4/2022.
//

import XCTest
import CoreLocation
@testable import MythicWeather

class MythicWeatherTests: XCTestCase {
    func test_CLLocationCoordinate2DEquatableConformance() throws {
        /// Given
        let baseCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        /// When
        let identicalToBaseCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let differentToBaseCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 0)
        let differentToBaseCoordinateAlt = CLLocationCoordinate2D(latitude: 0, longitude: 1)
        
        /// Then
        XCTAssertEqual(baseCoordinate, identicalToBaseCoordinate)
        XCTAssertNotEqual(baseCoordinate, differentToBaseCoordinate)
        XCTAssertNotEqual(baseCoordinate, differentToBaseCoordinateAlt)
    }
}
