//
//  DataService.swift
//  FundooDemo
//
//  Created by BridgeLabz on 12/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import Firebase

let firebasePath = "https://fundoodemo-475ed.firebaseio.com/"

class DataService {

static let dataservice = DataService()
    
    private var _BASE_REF = Database.database().reference(fromURL: "\(firebasePath)")
    private var _ITEM_REF = Database.database().reference(fromURL: "\(firebasePath)/items")

    var BASE_REF: DatabaseReference {
        return _BASE_REF
    }
    
    var ITEM_REF: DatabaseReference {
        return _ITEM_REF
    }
}
