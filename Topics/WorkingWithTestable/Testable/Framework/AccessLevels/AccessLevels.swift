//
//  AccessLevels.swift
//  Testable
//
//  Created by Geraldo Bastos on 11/26/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import Foundation

/**
 *AccessLevelsClass* is a class with all access levels (private, internal and public).
 */
public class AccessLevelsClass {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    private var privateVariable:String = "Private Variable"
    
    internal var internalVariable:String = "Internal Variable"
    
    public var publicVariable:String = "Public Variable"
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Initializer Method
    //------------------------------------------------------------------------------------------------------
    
    public init(){}
}


/**
 Extension *AccessLevelsClass* created to access a private property.
 */
extension AccessLevelsClass {

    //------------------------------------------------------------------------------------------------------
    // MARK: - Self Public Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
     This method access a privateVariable of the class.
     
     - returns: Return the privateVariable value.
     */
    public func getPrivateVariable() -> String {
        return privateVariable
    }
}

