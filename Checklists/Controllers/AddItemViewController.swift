//
//  AddItemViewController.swift
//  Checklists
//
//  Created by lpiem on 14/03/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit


class AddItemViewController: UITableViewController,UITextFieldDelegate {


    var delegate : AddItemViewControllerDelegate!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        
         delegate.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        
       
        if nameTextField.text == ""
        {self.doneButton.isEnabled = false}
            
    else{print(nameTextField.text ?? "lin")
                dismiss(animated: true, completion: nil)}
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.becomeFirstResponder()
        nameTextField.delegate=self
        
    }
    
    
    
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        
        let oldString = nameTextField.text!
        let newString = oldString.replacingCharacters(in: Range(range, in:oldString)!, with: string)
        self.doneButton.isEnabled = !newString.isEmpty
        return true
    }
    
    
}


protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}


