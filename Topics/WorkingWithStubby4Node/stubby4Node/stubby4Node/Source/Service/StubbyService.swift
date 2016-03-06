//
//  Connection.swift
//  stubby4Node
//
//  Created by Geraldo Bastos on 7/29/15.
//  Copyright (c) 2015 Geraldo Bastos. All rights reserved.
//

import Foundation

/**
 *StubbyService* is responsible to connect the API layer.
 */
public class StubbyService:NSObject, NSURLConnectionDelegate {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Self Public Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
    This method get the resulted API method listHome and return it across the closure.
    
    - parameter success: Is a closure with data:NSData? that represent the JSON API response and 
    error:NSError? if was any error with networking.
    
    - important: You need to run *Stubby4Node* server. See the folder stubby and shell script startServer.sh
    */
    public static func loadListHome (success:(data:NSData?, error:NSError?)->Void) {
        let url:NSURL = NSURL(string: "http://0.0.0.0:8882/listHome")!
        let urlRequest:NSURLRequest = NSURLRequest(URL: url)
        
        [NSURLConnection.sendAsynchronousRequest(urlRequest,
            queue:NSOperationQueue.mainQueue(),
            completionHandler: { (urlResponse:NSURLResponse?, data:NSData?, error:NSError?) in
                success(data: data, error: error)
        })]
    }
}