//
//  Book.swift
//  ModelTest
//
//  Created by Geraldo Bastos on 9/27/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import Foundation

/**
 Model class and represents the Book information.
 */
class Book:NSObject {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    var name:String! = ""
    var age:NSNumber! = NSNumber(integer: 0)
    var author:String! = ""
    var twitter:String! = ""
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Initializer Method
    //------------------------------------------------------------------------------------------------------
    
    init (json:[String: AnyObject]?) {
        if let jsonInfo = json {
            
            if let ebook = jsonInfo["ebook"] as? String {
                self.name = ebook
            }
            
            if let ageStr = jsonInfo["age"] as? NSString {
                self.age = NSNumber(integer: ageStr.integerValue)
            }
            
            if let author = jsonInfo["author"] as? String {
                self.author = author
            }
            
            if let twitter = jsonInfo["twitter"] as? String {
                self.twitter = twitter
            }
        }
    }
}
