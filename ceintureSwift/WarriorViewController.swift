//
//  WarriorViewController.swift
//  ceintureSwift
//
//  Created by julien gimenez on 16/03/2015.
//  Copyright (c) 2015 julien gimenez. All rights reserved.
//

import UIKit

class WarriorViewController : UIViewController,UITextFieldDelegate{
    
    //var beltColor = UIColor.whiteColor()
    
    @IBOutlet var beltView: UIView!
    @IBOutlet var warriorTextField1 :UITextField!
    @IBOutlet var warriorTextField2 :UITextField!
    var notation:NotationViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.hajime, style: .Plain, target: self, action: "startFight")
        beltView.backgroundColor = UIColor(patternImage: UIImage(named:BeltsObjects.beltImage)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startFight() {
        
        if warriorTextField1.text != ""{
            
            WarriorsObjects.firstWarriorName = warriorTextField1.text
            
            if warriorTextField2.text != ""{

                WarriorsObjects.secondWarriorName = warriorTextField2.text
                self.performSegueWithIdentifier("pushToDouble", sender: self)
            }
            else{
                WarriorsObjects.secondWarriorName = Constants.unknown
                self.performSegueWithIdentifier("pushToSimple", sender: self)
            }
        }
        else{
            self.emptyWarrior()
        }
    }
    
    func emptyWarrior(){
        
        let alert = UIAlertController(title: "",
            message: Constants.putNamePlease,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: Constants.ok,
            style: UIAlertActionStyle.Default,
            handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            animateViewMoving(true, moveValue: 25)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
            animateViewMoving(false, moveValue: 25)
        }
    }
    
    // MARK: - uitextfield delegate & keyboard
    
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
 
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        warriorTextField2.resignFirstResponder()
        warriorTextField1.resignFirstResponder()
    }
}