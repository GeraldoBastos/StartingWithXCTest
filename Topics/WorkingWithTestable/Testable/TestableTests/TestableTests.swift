//
//  TestableTests.swift
//  TestableTests
//
//  Created by Geraldo Bastos on 8/13/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import XCTest
@testable import Testable

class TestableTests: XCTestCase {
    
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
   
    func testCastType_WithNegativeValue_ShouldSuccess () {
        let viewController:ViewController = ViewController()
        let result:String = "-10"
        let realResult = viewController.castNumberToString(-10)
        XCTAssertEqual(result, realResult, "castNumberToString returned a different result.")
        
    }
}
