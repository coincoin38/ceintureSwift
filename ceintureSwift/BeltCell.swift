//
//  BeltCell.swift
//  ceintureSwift
//
//  Created by julien gimenez on 17/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class BeltCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        
        if(selected){
            titleLabel.textColor = Utils.hexStringToUIColor(Constants.beltTitleSelectionColor)
        }else{
            titleLabel.textColor = Utils.hexStringToUIColor(Constants.beltTitleDefaultColor)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
        if(highlighted){
            titleLabel.textColor = Utils.hexStringToUIColor(Constants.beltTitleSelectionColor)
        }else{
            titleLabel.textColor = Utils.hexStringToUIColor(Constants.beltTitleDefaultColor)
        }
    }
    
    func loadItem(title title: String) {
        titleLabel.text = "  " + title + "  "
    }
}
