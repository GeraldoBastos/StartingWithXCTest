//
//  ViewController.swift
//  stubby4Node
//
//  Created by Geraldo Bastos on 8/3/15.
//  Copyright (c) 2015 Geraldo Bastos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    @IBOutlet weak var homeTableView:UITableView?
    private var listHome:[NSDictionary] = []
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller LifeCycle Methods
    //------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StubbyService.loadListHome { (data, error) in
            if data != nil && error == nil {
                do {
                    self.listHome = try NSJSONSerialization.JSONObjectWithData(data!,
                        options:NSJSONReadingOptions.MutableContainers) as! [NSDictionary]
                    
                    if self.listHome.count > 0 {
                        self.homeTableView?.reloadData()
                    }
                } catch {
                    print("Can not convert JSON to Object.")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Override Public Methods
    //------------------------------------------------------------------------------------------------------
    
    //--------------------------------------
    // MARK: - UITableViewDataSource
    //--------------------------------------
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listHome.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        let cell:UITableViewCell = tableView .dequeueReusableCellWithIdentifier("cell",
            forIndexPath: indexPath)
        let jsonInfo:NSDictionary? = self.listHome[indexPath.row]
        let longValue:NSNumber? = jsonInfo?.objectForKey("text") as? NSNumber
        cell.textLabel?.text = "row: \(longValue!)"
        
        return cell
    }
    
    //--------------------------------------
    // MARK: - UITableViewDelegate
    //--------------------------------------
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell:UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        
        print(cell?.textLabel?.text)
    }
    
}