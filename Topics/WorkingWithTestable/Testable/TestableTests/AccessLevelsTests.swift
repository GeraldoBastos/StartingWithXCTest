//
//  AccessLevelsTests.swift
//  Testable
//
//  Created by Geraldo Bastos on 11/26/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import XCTest
@testable import AccessLevels

class AccessLevelsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testAccessLevels_WithDebugMode_ShouldSuccess() {
        let accessLevels:AccessLevelsClass = AccessLevelsClass()

        XCTAssertNotNil(accessLevels.publicVariable)
        XCTAssertNotNil(accessLevels.getPrivateVariable())
        XCTAssertNotNil(accessLevels.internalVariable)
        
    }
}

