//
//  MainVCViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 09/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class MainVC: UIViewController  {

    @IBAction func BtnClk(_ sender : UIBarButtonItem) {
        print("Side Menu Click")
        NotificationCenter.default.post(name: NSNotification.Name("Togglesidemenu"), object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(showNotes), name: NSNotification.Name(rawValue: "Show Note"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(Logout), name: NSNotification.Name(rawValue: "Logout"), object: nil)
    }
    
    @objc func showNotes()
    {
        performSegue(withIdentifier: "MainVC", sender: nil)
    }
    
    @objc func Logout()
    {
        performSegue(withIdentifier: "LogoutViewController", sender: nil)
    }
    
    
}
