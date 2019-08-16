//
//  ViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 09/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class ControllerVC: UIViewController {

    
    @IBOutlet var SideMenuConstraint: NSLayoutConstraint!
    
   var sideMenuOpen = false
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("Togglesidemenu"), object: nil)
    }
    @objc func toggleSideMenu() {
        
        if sideMenuOpen {
            sideMenuOpen = false
            SideMenuConstraint.constant = -240
        } else {
            sideMenuOpen = true
            SideMenuConstraint.constant = 0
        }
        
         UIView.animate(withDuration: 0.5){
         self.view.layoutIfNeeded()
        }
        
    }

}

