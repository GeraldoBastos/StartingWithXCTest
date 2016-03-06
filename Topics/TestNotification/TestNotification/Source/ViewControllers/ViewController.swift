//
//  ViewController.swift
//  TestNotification
//
//  Created by Geraldo Bastos on 11/15/15.
//  Copyright © 2015 GeraldoBastos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    @IBOutlet weak var tableViewPlayers: UITableView!

    let playersArray:[String] = ["Geraldo", "Diney", "Gabriel", "Jefferson", "Josicreide", "Josicraine",
    "Xaiane"]
    
    var alertController:UIAlertController?
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller LifeCycle Methods
    //------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("receivedNotification:"),
            name: kSelectedPlayerNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
    Received the notification with name ```kSelectedPlayerNotification```
    */
    func receivedNotification(notification:NSNotification) {
        
        if let playerName = notification.object as? String {
            self.showAlert(title:"Selected Player", message: playerName)
        }
    }
    
    /**
     Show alert with notification content.
     */
    func showAlert(title title:String?, message:String?) {
        
        self.alertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let action:UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,
            handler: { (action:UIAlertAction) -> Void in
                self.alertController = nil
        })
        
        self.alertController!.addAction(action)
        self.presentViewController(self.alertController!, animated: true, completion: nil)
    }

    //--------------------------------------
    // MARK: - UITableViewDelegate
    //--------------------------------------

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:CustomCell = self.tableViewPlayers.cellForRowAtIndexPath(indexPath) as! CustomCell
        cell.setSelected(false, animated: true)
    }

    //--------------------------------------
    // MARK: - UITableViewDataSource
    //--------------------------------------

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playersArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customCellID", forIndexPath: indexPath)
        as! CustomCell
        
        cell.showCellWithName(self.playersArray[indexPath.row])
        
        return cell
    }
}

