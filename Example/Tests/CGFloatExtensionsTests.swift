//
//  CGFloatExtensionsTests.swift
//  OverlapStack
//
//  Created by Nayanda Haberty on 24/12/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import XCTest
@testable import OverlapStack

class CGFloatExtensionsTests: XCTestCase {
    
    func test_givenNormalNumber_whenGetPositiveNormalizedValue_shouldReturnZero() {
        XCTAssertEqual(CGFloat(1).positiveNormalizedValue, 1)
    }
    
    func test_givenNegativeNumber_whenGetPositiveNormalizedValue_shouldReturnZero() {
        XCTAssertEqual(CGFloat(-1).positiveNormalizedValue, .zero)
    }
    
    func test_givenZero_whenGetPositiveNormalizedValue_shouldReturnZero() {
        XCTAssertEqual(CGFloat(0).positiveNormalizedValue, .zero)
    }
    
    func test_givenNan_whenGetPositiveNormalizedValue_shouldReturnZero() {
        XCTAssertEqual(CGFloat.nan.positiveNormalizedValue, .zero)
    }
    
    func test_givenInfininy_whenGetPositiveNormalizedValue_shouldReturnZero() {
        XCTAssertEqual(CGFloat.infinity.positiveNormalizedValue, .zero)
    }
    
}
