//
//  NotationSimpleViewController.swift
//  ceintureSwift
//
//  Created by julien gimenez on 17/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class ContainerViewController : UIViewController{

    @IBOutlet var beltView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        beltView.backgroundColor = UIColor(patternImage: UIImage(named:BeltsObjects.beltImage)!)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.mate, style: .Plain, target: self, action: "stopFight")
    }
    
    func stopFight() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}