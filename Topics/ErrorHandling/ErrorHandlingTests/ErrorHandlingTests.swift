//
//  ErrorHandlingTests.swift
//  ErrorHandlingTests
//
//  Created by Geraldo Bastos on 11/28/15.
//  Copyright © 2015 GeraldoBastos. All rights reserved.
//

import XCTest
@testable import ErrorHandling

func sumPlus(a: Int, b: Int) throws -> Int {
    if (a == b) {
        
    }
    
    return a + b
}

class ErrorHandlingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testSumPlus_WithValidsIntsParams_ShouldNotException() {
        let name = "Geraldo"
        
        XCTAssertNotThrows("jhvjhj h jh ") { () -> () in
            let result = try name.value()
            XCTAssertEqual(result, name, "Result value should be equals.")
        }
        
        do {
            let result = try name.value()
            XCTAssertEqual(result, name, "Result value should be equals.")
        } catch { }
        
        
    }
    
    func testEmptyValue_WithEmptyString_ShouldException() {
        XCTAssertThrows("Did not get exception.") { () -> () in
          let _ = try "".value()
        }
    }
    
}


extension XCTestCase {
    func XCTAssertThrows(message: String = "", file: String = __FILE__ , line: UInt = __LINE__,
        behaviour: () throws -> () ) {
        do {
            try behaviour()
            XCTFail(message, file: file, line: line)
        } catch {}
    }
    
    func XCTAssertNotThrows(message: String = "", file: String = __FILE__, line: UInt = __LINE__,
        behaviour: () throws -> () ) {
        do {
            try behaviour()
        } catch {
            XCTFail(message, file: file, line: line)
        }
    }
}