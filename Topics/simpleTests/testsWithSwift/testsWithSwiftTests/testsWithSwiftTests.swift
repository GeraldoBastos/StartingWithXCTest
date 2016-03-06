//
//  testsWithSwiftTests.swift
//  testsWithSwiftTests
//
//  Created by Geraldo Bastos on 8/14/15.
//  Copyright (c) 2015 Geraldo Bastos. All rights reserved.
//

import UIKit
import XCTest
import testsWithSwift

class testsWithSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the 
        // class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the 
        // class.
        super.tearDown()
    }
    
    func testDoubleValue_WithValueGreaterThanZero_ShouldSuccess () {
        let expectedValue:Int = 2
        let value = ViewController.doubleValue(1)
        XCTAssertEqual(expectedValue, value, "Incorrect response to the double value")
    }
    
    func testDoubleValue_WithValueEqualZero_ShoudlFail () {
        let expectedValue:Int = 0
        let value = ViewController.doubleValue(0)
        XCTAssertEqual(expectedValue, value, "Incorrect response")
    }
    
    func testDoubleValue_WithValueLessThanZero_ShouldFail () {
        let expectedValue:Int = -1
        let value = ViewController.doubleValue(-1)
        XCTAssertEqual(expectedValue, value, "Incorrect response")
    }
    
}
