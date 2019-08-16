//
//  CreateNoteViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 12/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class CreateNoteViewController: UIViewController, UITextFieldDelegate {

   // var Path = ""
    
    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var NoteTextField: UITextField!
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Note"
        ref = Database.database().reference().child("Notes")
        }
    
   
    
    @IBAction func createButtonHandler(_ sender: Any) {
        
//        let titles = TitleTextField.text
//        let note = NoteTextField.text
//
//        let notes = NoteModel(noteTitle: titles!, noteDescription: note!)
//         Database.database().reference().child("Notes").childByAutoId().setValue(notes.asDict())
//
        AddNote()
       navigationController?.popViewController(animated: true)
    }
    
    func AddNote()
    {
        let key = ref?.childByAutoId().key
        
        let notes = ["noteId":key,
                     "noteTitle": TitleTextField.text! as String,
                     "noteDescription": NoteTextField.text! as String
                     ]
        ref?.child(key!).setValue(notes)
        
        print("Note Added")
    }
    
    
}




