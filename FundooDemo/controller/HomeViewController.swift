//
//  HomeViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 12/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var items = [NoteModel]()
    
    var ref: DatabaseReference!
    
    private var databaseHandle: DatabaseHandle!
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
