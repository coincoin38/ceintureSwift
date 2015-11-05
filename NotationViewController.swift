//
//  NotationViewController.swift
//  ceintureSwift
//
//  Created by julien gimenez on 23/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class NotationViewController : UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var lbTechniqueName: UILabel!
    @IBOutlet weak var lbTechniquePosition: UILabel!
    var positionTechnique: NSInteger!
    var totalTechniques: NSInteger!

    override func viewDidLoad() {
        super.viewDidLoad()
        setGesturesSwipe()
        setWarriorsName()
        setData()
        setInterface()
    }
    
// MARK: - Init data

    func setData(){
        setPositionTechnique(0)
        setTotalTechniques()
    }
    
    func setPositionTechnique(position:NSInteger)->NSInteger{
        positionTechnique = position
        return positionTechnique+1
    }
    
    func setTotalTechniques()->NSInteger{
        totalTechniques = BeltsObjects.itemsBeltsTechniques[BeltsObjects.indexBelt].count
        return totalTechniques
    }
    
// MARK: - Init interface
    
    func setInterface(){
        setTechniqueName()
        setTechniquePosition()
    }

    func setWarriorsName(){
    }
    
    func setTechniquePosition(){
        lbTechniquePosition.text = String(positionTechnique+1)+"/"+String(totalTechniques)
    }
    
    func setTechniqueName(){
        
        if let appArrayEntries = BeltsObjects.itemsBeltsTechniques[BeltsObjects.indexBelt].array{
            lbTechniqueName.text = appArrayEntries[positionTechnique]["name"].string!
        }
    }
    
// MARK: - uitableview delegate & source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:NotationCell = self.tableView.dequeueReusableCellWithIdentifier("notationCellIdentifier") as! NotationCell
        cell.loadItem("test")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Touch")
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
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

    
// MARK: - Gestures & actions
    
    func setGesturesSwipe(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                if(positionTechnique != 0){
                    positionTechnique = positionTechnique-1
                }
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.Left:
                if(positionTechnique < totalTechniques-1){
                    positionTechnique = positionTechnique+1
                }
                print("Swiped left")
            default:
                break
            }
            setInterface()
        }
    }
    
    @IBAction func setNotation(sender: UIButton) {
        print(sender.tag)
    }
    
    func isLandscapeOrientation() -> Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    
}