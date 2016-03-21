//
//  switchCell.swift
//  Yelp
//
//  Created by Sumaiya Mansur on 3/20/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit


// @objc protocol switchCellDelegate {
      //optional func switchCell(switchCell: switchCell,
        //didChangeValue value: Bool)
//}

@objc protocol switchCellDelegate {
    optional func swicthCell(switchCell: SwitchCell,
        didChangeValue value: Bool)
}


class SwitchCell: UITableViewCell {
   

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: switchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func switchValueChanged(){
        if delegate != nil {
            delegate!.swicthCell?(self, didChangeValue: onSwitch.on)
        }
    }
    
}

