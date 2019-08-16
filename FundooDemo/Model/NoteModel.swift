//
//  NoteModel.swift
//  FundooDemo
//
//  Created by BridgeLabz on 10/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct NoteModel {
    
    private(set) var noteId:String!
    private(set) var noteTitle:String?
    private(set) var noteDescription:String?
    
    init(noteId:String?,noteTitle:String?,noteDescription:String?)
    {
        self.noteId = noteId
        self.noteTitle = noteTitle
        self.noteDescription = noteDescription
    }
    
    func asDict() -> [String:String] {
        var notedictionary = [String:String]()
        
        notedictionary["noteId"] = self.noteId
        notedictionary["noteTitle"] = self.noteTitle
        notedictionary["noteDescription"] = self.noteDescription
        
        return notedictionary
    }
    
    enum PropertyKey:String {
        case noteId = "NoteId"
        case noteTitle = "noteTitle"
        case noteDescription = "noteDescription"
    }
 
}
