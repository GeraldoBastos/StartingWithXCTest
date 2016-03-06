//
//  StubbyServiceTests.swift
//  stubby4Node
//
//  Created by Geraldo Bastos on 8/3/15.
//  Copyright (c) 2015 Geraldo Bastos. All rights reserved.
//

import Foundation
import XCTest
import stubby4Node


class StubbyServiceTests: XCTestCase {
    let defaultTimeout:NSTimeInterval = 15
    
    func testLoadListHome_WithoutParam_ShoudlSuccess () {
        let expectation:XCTestExpectation = self.expectationWithDescription("\(__FUNCTION__)")
        
        StubbyService.loadListHome { (data, error) in
            XCTAssertNotNil(data, "Incorrect response of the API.")
            XCTAssertNil(error, "Error message \(error).")
            expectation.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(self.defaultTimeout, handler: { (error:NSError?) -> Void in
            XCTAssertNil(error,"\(error).")
        })
    }
}

