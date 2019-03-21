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
    var itemToEdit : ChecklistItem?
    
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
        
        
        if(itemToEdit == nil){let newItem = ChecklistItem(message: nameTextField.text!)
            delegate?.addItemViewController(self, didFinishAddingItem: newItem)}
        else{
            itemToEdit?.message=nameTextField.text! 
            delegate?.addItemViewController(self, didFinishEditingItem: itemToEdit!)}
        
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.isEnabled = false
        print(itemToEdit as Any)
        if(itemToEdit != nil){
            nameTextField.text = itemToEdit?.message
            self.title = "Edit an item"
        }
        
    }
    
    
}


protocol AddItemViewControllerDelegate : class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditingItem item: ChecklistItem)

}


