//
//  ViewController.swift
//  ceintureSwift
//
//  Created by julien gimenez on 16/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class BeltViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet
    var tableView: UITableView!

    //let itemsBelts: [String] = BeltsObjects.itemsBelts;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "BeltCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "beltCellIdentifier")
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        if(self.tableView.indexPathForSelectedRow != nil){
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - uitableview delegate & source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return BeltsObjects.itemsBeltsNames.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:BeltCell = self.tableView.dequeueReusableCellWithIdentifier("beltCellIdentifier") as! BeltCell
        cell.loadItem(title:BeltsObjects.itemsBeltsNames[indexPath.section])
        cell.backgroundColor = UIColor(patternImage: UIImage(named:BeltsObjects.itemsBeltsImages[indexPath.section])!)
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        BeltsObjects.beltName = BeltsObjects.itemsBeltsNames[indexPath.section]
        BeltsObjects.beltImage = BeltsObjects.itemsBeltsImages[indexPath.section]
        BeltsObjects.indexBelt = indexPath.section

        //println(BeltsObjects.itemsBeltsTechniques[BeltsObjects.indexBelt])
        self.performSegueWithIdentifier("goToWarrior", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == BeltsObjects.itemsBeltsNames.count-1){
            return 5.0
        }
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let view = UIView() // The width will be the same as the cell, and the height should be set in :
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView() // The width will be the same as the cell, and the height should be set in :
        view.backgroundColor = UIColor.clearColor()
        return view
    }
}

