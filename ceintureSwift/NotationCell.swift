//
//  NotationCell.swift
//  ceintureSwift
//
//  Created by julien gimenez on 30/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class NotationCell: UITableViewCell {

    @IBOutlet var noteTitle: UILabel!

    func loadItem(title: String) {
        noteTitle.text = title
    }
    
}