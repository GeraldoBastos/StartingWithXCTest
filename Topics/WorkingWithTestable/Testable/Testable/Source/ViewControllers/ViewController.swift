//
//  ViewController.swift
//  Testable
//
//  Created by Geraldo Bastos on 8/13/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller Lifecycle
    //------------------------------------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
     Responsible to convert *Int* type value to *String* type.
    */
    func castNumberToString(value:Int) -> String {
        return "\(value)"
    }
    
}

