//
//  TestNotificationTests.swift
//  TestNotificationTests
//
//  Created by Geraldo Bastos on 11/15/15.
//  Copyright © 2015 GeraldoBastos. All rights reserved.
//

import XCTest
@testable import TestNotification

class TestNotificationTests: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var viewController:ViewController?
    let view:UIView = UIView()
    
    override func setUp() {
        super.setUp()
        
        let navigationController = self.storyboard.instantiateInitialViewController() as? UINavigationController
        self.viewController = navigationController?.viewControllers.first as? ViewController
        view.addSubview(self.viewController!.view)
        
        self.viewController!.tableViewPlayers.reloadData()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    func testDispatchNotification_withNilObject_shouldFail() {
        
        NSNotificationCenter.defaultCenter().postNotificationName(kSelectedPlayerNotification, object: nil)
        XCTAssertNil(self.viewController!.alertController, "AlertController should be nil.")
    }
    
    func testDispatchNotification_withStringValue_shouldCreateAlert() {
        NSNotificationCenter.defaultCenter().postNotificationName(kSelectedPlayerNotification,
            object: "Geraldo")
        XCTAssertNotNil(self.viewController!.alertController,
            "The ViewController should be create an alert.")
    }
    
    
    func testReceiveNotification_withValidPlayerName_shouldReceiveSamePlayerName() {
        
        let cell = self.viewController!.tableViewPlayers.cellForRowAtIndexPath(
            NSIndexPath(forRow: 0, inSection: 0)) as! CustomCell

        
        let _ = self.expectationForNotification(kSelectedPlayerNotification, object: nil,
            handler: { (notification:NSNotification) -> Bool in
            
            XCTAssertNotNil(notification, "The method showCellWithName should posted the notification.")
            XCTAssertNotNil(notification.object, "The notification should has a not nil object.")
            let name = notification.object as? String
            XCTAssertEqual(name, "Geraldo", "Did not received the Geraldo value.")
                
            return true
        })
        
        cell.setSelected(true, animated: true)
        
        self.waitForExpectationsWithTimeout(2.0) { (error:NSError?) -> Void in
            XCTAssertNil(error, "Timeout with notification: \(error)")
        }
    }
    
}
