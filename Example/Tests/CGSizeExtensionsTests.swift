//
//  CGSizeExtensionsTests.swift
//  OverlapStack
//
//  Created by Nayanda Haberty on 13/01/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import XCTest
@testable import OverlapStack

class CGSizeExtensionsTests: XCTestCase {
    
    func test_givenZeroSize_whenGetIsRenderable_shouldReturnFalse() {
        let positiveNumber = Int.random(in: 1..<100)
        XCTAssertFalse(CGSize.zero.isRenderable)
        XCTAssertFalse(CGSize(width: .zero, height: positiveNumber).isRenderable)
        XCTAssertFalse(CGSize(width: positiveNumber, height: .zero).isRenderable)
    }
    
    func test_givenNegativeSize_whenGetIsRenderable_shouldReturnFalse() {
        let positiveNumber = Int.random(in: 1..<100)
        let negativeNumber = -(Int.random(in: 1..<100))
        XCTAssertFalse(CGSize(width: positiveNumber, height: negativeNumber).isRenderable)
        XCTAssertFalse(CGSize(width: negativeNumber, height: positiveNumber).isRenderable)
    }
    
    func test_givenPositiveSize_whenGetIsRenderable_shouldReturnTrue() {
        let positiveNumber = Int.random(in: 1..<100)
        XCTAssertTrue(CGSize(width: positiveNumber, height: positiveNumber).isRenderable)
    }
    
}
