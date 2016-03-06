//
//  ViewController.swift
//  testsWithSwift
//
//  Created by Geraldo Bastos on 8/14/15.
//  Copyright (c) 2015 Geraldo Bastos. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller LifeCycle Methods
    //------------------------------------------------------------------------------------------------------
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Self Public Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
    Responsible to double param value.
    
    - parameter value: Int value that will be doubled.
    
    - returns: Return the doubled value.
    */
    public static func doubleValue (value:Int) -> Int {
        if value > 0 {
            return value * 2
        }
        return value
    }
}
