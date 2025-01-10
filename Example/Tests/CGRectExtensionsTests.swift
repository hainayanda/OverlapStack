//
//  CGRectExtensionsTests.swwhent
//  OverlapStack
//
//  Created by Nayanda Haberty on 24/12/24.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import XCTest
@testable import OverlapStack

class CGRectExtensionsTests: XCTestCase {
    
    func test_givenAllPositiveRectangle_whenGetAxisRotationalSize_shouldReturnCorrectSize() {
        let rectangle = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertEqual(rectangle.axisRotationalSize, CGSize(width: 200, height: 200))
    }
    
    func test_givenYPositiveRectangle_whenGetAxisRotationalSize_shouldReturnCorrectSize() {
        let rectangle = CGRect(x: -100, y: 0, width: 100, height: 100)
        XCTAssertEqual(rectangle.axisRotationalSize, CGSize(width: 200, height: 200))
    }
    
    func test_givenXPositiveRectangle_whenGetAxisRotationalSize_shouldReturnCorrectSize() {
        let rectangle = CGRect(x: 0, y: -100, width: 100, height: 100)
        XCTAssertEqual(rectangle.axisRotationalSize, CGSize(width: 200, height: 200))
    }
    
    func test_givenAllNegativeRectangle_whenGetAxisRotationalSize_shouldReturnCorrectSize() {
        let rectangle = CGRect(x: -100, y: -100, width: 100, height: 100)
        XCTAssertEqual(rectangle.axisRotationalSize, CGSize(width: 200, height: 200))
    }
    
    func test_givenInAxisRectangle_whenGetAxisRotationalSize_shouldReturnCorrectSize() {
        let rectangle = CGRect(x: -50, y: -50, width: 100, height: 100)
        XCTAssertEqual(rectangle.axisRotationalSize, CGSize(width: 100, height: 100))
    }
    
}
