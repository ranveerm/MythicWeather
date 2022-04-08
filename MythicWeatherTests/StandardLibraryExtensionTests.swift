//
//  StandardLibraryExtensionTests.swift
//  MythicWeatherTests
//
//  Created by Ranveer Mamidpelliwar on 9/4/2022.
//

import XCTest
import MapKit
@testable import MythicWeather

class StandardLibraryExtensionTests: XCTestCase {
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
    
    func test_metricDisplayRepresentation() throws {
        /// Given
        let mockMetric = 8.230001
        let mockMetricAlt = 8.0
        let expectedMockMetric = "8.23"
        let expectedMockMetricAlt = "8.00"
        
        /// When
        let computedMockMetric = mockMetric.metricDisplayRepresentation
        let computedMockMetricAlt = mockMetricAlt.metricDisplayRepresentation
        
        /// Then
        XCTAssertEqual(expectedMockMetric, computedMockMetric)
        XCTAssertEqual(expectedMockMetricAlt, computedMockMetricAlt)
    }
}
