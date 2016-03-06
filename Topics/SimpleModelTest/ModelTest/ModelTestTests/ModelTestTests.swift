//
//  ModelTestTests.swift
//  ModelTestTests
//
//  Created by Geraldo Bastos on 9/27/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import XCTest
@testable import ModelTest

class ModelTestTests: XCTestCase {
    
    private let ebookName:String = "Iniciando com XCTest"
    private let author:String = "Geraldo Bastos"
    private let age:NSNumber = NSNumber(integer: 29)
    private let twitter:String = "@geraldobastos"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBookModel_withAllParams_shouldSuccess() {
        let params:[String: AnyObject] = [
            "ebook": self.ebookName,
            "author": self.author,
            "age": self.age.stringValue,
            "twitter": self.twitter]
        let book:Book = Book(json: params)
        
        XCTAssertEqual(self.ebookName, book.name, "Ebook name is different.")
        XCTAssertEqual(self.author, book.author, "Author name is different.")
        XCTAssertEqual(self.age, book.age, "Age is different.")
        XCTAssertEqual(self.twitter, book.twitter, "Twitter is different.")
    }
    
    func testBookModel_withEmptyParams_shouldSuccess() {
        let book:Book = Book(json: nil)
        
        XCTAssertEqual("", book.name, "Ebook name is not empty.")
        XCTAssertEqual("", book.author, "Author name is not empty.")
        XCTAssertEqual(NSNumber(integer: 0), book.age, "Age is not empty.")
        XCTAssertEqual("", book.twitter, "Twitter is not empty.")
    }
    
    func testBookModel_withAgeStringValue_shouldFailed() {
        let params:[String: AnyObject] = ["age": "29"]
        let book:Book = Book(json: params)
        
        XCTAssertNotEqual("29", book.age, "Age is not zero")
    }
    
}
