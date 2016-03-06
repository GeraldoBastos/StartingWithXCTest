//
//  ViewController.swift
//  ErrorHandling
//
//  Created by Geraldo Bastos on 11/28/15.
//  Copyright © 2015 GeraldoBastos. All rights reserved.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {

    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    @IBOutlet weak var mailTextField: UITextField!
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller LifeCycle Methods
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
    // MARK: - Override Public Methods
    //------------------------------------------------------------------------------------------------------
    
    //--------------------------------------
    // MARK: - UITextFieldDelegate
    //--------------------------------------
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        self.checkInfo()
        
        return true
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    func checkInfo() {
        
        do {
            let _ = try self.mailTextField.text?.value()
           
            self.showAlertWithMessage("Saved with success.")
            
        } catch String.StringError.EmptyValue {
            self.showAlertWithMessage("Empty field.")
        } catch {
            self.showAlertWithMessage("Something is wrong.")
        }
    }

    //--------------------------------------
    // MARK: - Actions
    //--------------------------------------
    
    @IBAction func tapView(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func tapLogIn(sender: AnyObject) {
        self.view.endEditing(true)
        self.checkInfo()
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //------------------------------------------------------------------------------------------------------
    
    private func showAlertWithMessage(message: String) {
        let alertController: UIAlertController = UIAlertController(title: "",
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alertController.addAction(action)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
}

/**
 Extension String class to create new features.
 */
public extension String {
    
    /**
     StringError is a public enum of type *ErrorType* and used to exception.
     */
    public enum StringError: ErrorType {
        case EmptyValue
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    func value() throws -> String? {
        
        guard !self.isEmpty else {
            throw StringError.EmptyValue
        }
        
        return self
    }
}

