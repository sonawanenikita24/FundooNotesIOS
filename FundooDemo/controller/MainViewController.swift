//
//  MainViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 14/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func BtnClick(_ sender: UIBarButtonItem) {
        print("Side Menu Click")
        NotificationCenter.default.post(name: NSNotification.Name("Togglesidemenu"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(showNotes), name: NSNotification.Name("DisplayNotes"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(Logout), name: NSNotification.Name("LogOut"), object: nil)
    }
    
    @objc func showNotes()
    {
        
//        performSegue(withIdentifier: "MainVC", sender: nil)
//        let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
//        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc func Logout()
    {
        let mainVC1 = storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
        self.navigationController?.pushViewController(mainVC1, animated: true)

    }

    
}
