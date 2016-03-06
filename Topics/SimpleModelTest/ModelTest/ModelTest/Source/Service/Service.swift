//
//  Service.swift
//  ModelTest
//
//  Created by Geraldo Bastos on 9/27/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import Foundation

/**
 *Service* class is responsible to networking layer.
 */
class Service: NSObject {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    class func getBookInfo (finished:(Book)-> Void) {
        var url = "http://httpbin.org/get?"
        let params: String = "ebook=Iniciando%20com%20XCTest&author=GeraldoBastos&twitter=@geraldobastos&age=30"
        
        url = url + params
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: url)!, completionHandler: {
            (data, response, error) in
            var book:Book = Book(json: nil)
            if let JSONData = data {
                do {
                    if let JSONResponse = try NSJSONSerialization.JSONObjectWithData(JSONData,
                        options: .MutableContainers) as? NSDictionary {
                        let args = JSONResponse.objectForKey("args") as? [String: AnyObject]
                        book = Book(json: args)
                    }
                } catch {
                    print("\(error)")
                }
            }
            finished(book)
        })
            
        task.resume()
    }
    
}