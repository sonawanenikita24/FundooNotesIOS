//
//  FirebaseHelper.swift
//  FundooDemo
//
//  Created by BridgeLabz on 12/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHelper {
    
    private var rootNode = "Notes"
    private var firebaseRef = Database.database().reference()
    
    init()
    {
        self.firebaseRef.childByAutoId()
    }
}
