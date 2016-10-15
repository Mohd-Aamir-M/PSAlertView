//
//  ViewController.swift
//  PSAlertView
//
//  Created by MacMini03 on 30/08/16.
//  Copyright © 2016 MacMini03. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PSAlertViewdelegate {
    var  alertView : PSAlertView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Show simpleCenterPop alertview with smooth scale
    @IBAction func clickCenterPopSmoothAlert(_ sender: AnyObject) {
        alertView?.isAlert = true
        alertView = PSAlertView (title: "Alert" ,message: "Kothiyadfgjkdfgkjdfghdkhfgkhdfkdhfghdfkjgkjhdfkjhshfgkhsdfgkhksdhfgkhsdfgkhfg") // intialze alertView
        alertView!.delegate = self
        alertView!.showCancelButton = true
        alertView?.tag = 2
        //upto 4 buttons
        alertView?.buttons = ["Retry"]
        alertView?.tblViewAlertButton?.layer.cornerRadius = 12.0
        alertView?.cancelButtonTitle = "Dimiss"
        
        alertView?.objAnimationType = .alertCenterPop
        alertView! .display()
    }
    
    // Show CenterPopOut alertview bring from center, scale 15% from original size, Scale down 10% of orig- inal size and set to original destination frame.
    @IBAction func clickAlertCenterPopOut(_ sender: AnyObject) {
        alertView?.isAlert = true
        alertView = PSAlertView (title: "" ,message: "Multiple alert options") // intialze alertView
        alertView!.delegate = self
        alertView!.showCancelButton = true
        alertView?.tag = 2
        //upto 4 buttons
        alertView?.buttons = ["Retry","button1"]
        alertView?.tblViewAlertButton?.layer.cornerRadius = 12.0
        alertView?.cancelButtonTitle = "Dimiss"
        alertView?.objAnimationType = .alertCenterPopOut
        alertView! .display()
    }
    
    // Show CenterFade alertview with fadein
    @IBAction func clickAlertFadeInAnimation(_ sender: AnyObject) {
        alertView?.isAlert = true
        alertView = PSAlertView (title: "Alert" ,message: "") // intialze alertView
        alertView!.delegate = self
        alertView!.showCancelButton = true
        alertView?.tag = 2
        //upto 4 buttons
        //   alertView?.buttons = ["Retry","button1","button2"]
        alertView?.tblViewAlertButton?.layer.cornerRadius = 12.0
        alertView?.cancelButtonTitle = "OK"
        alertView?.objAnimationType = .alertCenterFade
        alertView! .display()
    }
    
    @IBAction func clickElasticAnimation(_ sender: AnyObject) {
        alertView = PSAlertView (title: "Actionsheet" ,message: "") // intialze alertView
        alertView?.isAlert = false
        alertView!.delegate = self
        alertView!.showCancelButton = true
        //up to 4 buttons
        alertView?.buttons =  ["button1","button2","button3","button4"]
        alertView?.tblViewLeadingConstraints.constant = 0
        alertView?.tag = 2
        alertView?.cancelButtonTitle = "Cancel"
        alertView?.objAnimationType = .sheetElasticIn
        alertView! .display()
        
    }
    
    @IBAction func clickActionSheetSimpleIn(_ sender: AnyObject) {
        alertView?.isAlert = false
        alertView = PSAlertView (title: "Actionsheet" ,message: "Choose option") // intialze alertView
        alertView?.isAlert = false
        alertView!.delegate = self
        alertView!.showCancelButton = true
        //upto 4 buttons
        alertView?.buttons =  ["button1","button2"]
        alertView?.tblViewLeadingConstraints.constant = 0
        alertView?.tag = 2
        alertView?.cancelButtonTitle = "Cancel"
        alertView?.objAnimationType = .sheetSimpleIn
        alertView! .display()
    }
    
    // delegate of PSAlertView
    func didTapButton(_ alertView: PSAlertView, atIndex: NSInteger) {
        print("button index",atIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

