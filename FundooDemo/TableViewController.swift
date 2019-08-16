//
//  TableViewController.swift
//  FundooDemo
//
//  Created by BridgeLabz on 13/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {

    @IBOutlet weak var notesTableView: UITableView!
  
    // creating array for notemodel
    var itemList = [NoteModel]()
    
    let ref = Database.database().reference().child("Notes")
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        RetriveData()
     //  self.notesTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        RetriveData()
        
    }
    
//    func addObserver(){
//         NotificationCenter.default.addObserver(self, selector: #selector(showNotes(_:)), name: NSNotification.Name("DisplayNotes"), object: nil)    }
//
//
//    
//    @objc func showNotes(_ notification : NSNotification){
//       
//        let indexPath : Int = notification.userInfo!["indexPath"] as! Int
//        switch indexPath {
//        case 0:
//                      notesTableView.reloadData()
//        default:
//            notesTableView.reloadData()
//        }
//}
    
    
    func RetriveData(){
    
    // ref = Database.database().reference().child("Notes")
       ref.observe(DataEventType.value, with: {(snapshot) in
        if snapshot.childrenCount > 0 {
            self.itemList.removeAll()
            
            for item in snapshot.children.allObjects as! [DataSnapshot]{
                let itemObject = item.value as? [String:AnyObject]
                let Title = itemObject?["noteTitle"]
                let Desciption = itemObject?["noteDescription"]
                let Id = itemObject?["noteId"]
                
                let notes = NoteModel(noteId: Id as! String?, noteTitle: Title as! String?, noteDescription: Desciption as! String?)
                
                self.itemList.append(notes)
                
                
            }
             self.notesTableView.reloadData()
        }
       })
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let NoteList = itemList[indexPath.row]
        
        let alertController = UIAlertController(title: NoteList.noteTitle, message: "Choose what operation want to perform", preferredStyle: . alert)
        
        // for update
        let updateAction = UIAlertAction(title: "Update", style: .default) {(_) in
            
            let id = NoteList.noteId
            
            let title = alertController.textFields?[0].text
            let desc = alertController.textFields?[1].text
            
            self.UpdateNote(id: id!, title: title, desc: desc)
            
        }
        
        // for delete
        let DeleteAction = UIAlertAction(title: "Delete", style: .default) {[weak self](_) in
            
            let id = NoteList.noteId
            self?.DeleteNote(id: id!)
       
        }
        
        alertController.addTextField{(textField) in
            textField.text = NoteList.noteTitle
        }
        
        alertController.addTextField{(textField) in
            textField.text = NoteList.noteDescription
        }
        
        alertController.addAction(updateAction)
        
        alertController.addAction(DeleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func UpdateNote(id:String,title:String?,desc:String?)
    {
        let note = ["noteId":id,
                    "noteTitle":title,
                    "noteDescription":desc
                    ]
        
        ref.child(id).setValue(note)
        
        let alertController = UIAlertController(title:"Successful", message: "Note updated successfully", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.cancel, handler: { [weak self] (action) in
            self?.dismiss(animated: true, completion: nil)
        }))
        
        present(alertController, animated: true, completion: nil)
       
    }
    
    func DeleteNote(id:String)
    {
        ref.child(id).setValue(nil)
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellBook", for: indexPath) as! TableViewCell
      
        let Notes:NoteModel
        
        Notes = itemList[indexPath.row]
        
        cell.notetitle.text = Notes.noteTitle
        cell.notedesc.text = Notes.noteDescription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
