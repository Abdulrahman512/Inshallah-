//
//  AddingNewList.swift
//  MyFirstApp1
//
//  Created by Abdulrahman Althobaiti on 7/31/17.
//  Copyright © 2017 Abdulrahman Althobaiti. All rights reserved.
//

import UIKit

class AddingNewListTableViewController: UIViewController , UITextFieldDelegate  {
    
@IBOutlet weak var doneBarbutton: UIBarButtonItem!
    
@IBAction func done() {
    
    dismiss(animated: true, completion: nil)
}
    
@IBOutlet weak var nameTextfield: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ListTableViewController {
            destination.tasks.append(Task(name: nameTextfield.text!))
            destination.tableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextfield.becomeFirstResponder()
        //keyboard automatically appeared once the screen opens.
 }
    
    func textField(_ nameTextfield: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        //gives you only which part of the text should be replaced (the range) and the text it should be replaced with (the replacement string).
        let oldText = nameTextfield.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        // figure out what the new text will be
        doneBarbutton.isEnabled = (newText.length > 0)
        //Once you have the new text, you check if it’s empty by looking at its length, and enable or disable the Done button accordingly
        
        return true
        
    }
}
