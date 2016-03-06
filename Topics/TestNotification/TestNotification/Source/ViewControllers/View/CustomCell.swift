//
//  CustomCell.swift
//  TestNotification
//
//  Created by Geraldo Bastos on 11/15/15.
//  Copyright © 2015 GeraldoBastos. All rights reserved.
//

import Foundation
import UIKit

/**
 *CustomCell* is a class of *UITableViewCell* type and responsible to show names in a tableView.
 */
class CustomCell: UITableViewCell {
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Properties
    //------------------------------------------------------------------------------------------------------
    
    @IBOutlet weak var labelPlayerName:UILabel!
    var name:String?
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Internal Methods
    //------------------------------------------------------------------------------------------------------
    
    /**
    Set content value in label cell.
    */
    func showCellWithName(playerName:String?) {
        self.name = playerName
        
        if let name = playerName {
            self.labelPlayerName.text = name
        }
    }
    
    //------------------------------------------------------------------------------------------------------
    // MARK: - Override Public Methods
    //------------------------------------------------------------------------------------------------------
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            NSNotificationCenter.defaultCenter().postNotificationName(kSelectedPlayerNotification,
                object: self.name)
        }
    }
    
}