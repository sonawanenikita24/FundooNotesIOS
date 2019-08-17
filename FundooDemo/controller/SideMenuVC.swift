//
//  SideMenuVC.swift
//  FundooDemo
//
//  Created by BridgeLabz on 09/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {
    
    var arrNames = ["Notes" ,"LogOut"]
    
    @IBOutlet var LblName: UILabel!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNames.count
    }
   
   override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuViewCell
    
        cell.notelbl.text = arrNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell is\(indexPath.row)")
        switch indexPath.row
        {
        case nameForIndexpath.Notes.rawValue :
          
             NotificationCenter.default.post(name: NSNotification.Name("DisplayNotes"), object: nil, userInfo: ["indexPath":indexPath.row])
          NotificationCenter.default.post(name:NSNotification.Name("Togglesidemenu"),object: nil)
           
        
        case nameForIndexpath.LogOut.rawValue:
            NotificationCenter.default.post(name:NSNotification.Name("Togglesidemenu"),object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("LogOut"), object: nil, userInfo: ["indexPath":indexPath.row])
        
            
        default:
            print("default")
        }
    }
}

extension SideMenuVC{
    enum nameForIndexpath: Int {
        case Notes = 0
        case LogOut = 1
    }
}
