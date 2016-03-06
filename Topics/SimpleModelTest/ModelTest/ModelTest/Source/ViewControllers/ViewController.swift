//
//  ViewController.swift
//  ModelTest
//
//  Created by Geraldo Bastos on 9/27/15.
//  Copyright © 2015 Geraldo Bastos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    @IBOutlet weak var bookNameLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var ageLabel:UILabel!
    @IBOutlet weak var twitterLabel:UILabel!

    //------------------------------------------------------------------------------------------------------
    // MARK: - View Controller LifeCycle Methods
    //------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.requestBookInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //------------------------------------------------------------------------------------------------------
    // MARK: - Private Methods
    //------------------------------------------------------------------------------------------------------
    
    private func showBookInfo(book:Book) {
        self.bookNameLabel.text = "Book name: \(book.name)"
        self.authorLabel.text = "author: \(book.author)"
        self.ageLabel.text = "age: \(book.age)"
        self.twitterLabel.text = "twitter: \(book.twitter)"
    }
    
    private func requestBookInfo() {
        Service.getBookInfo { (response:Book) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.showBookInfo(response)
            })
        }
    }
}

