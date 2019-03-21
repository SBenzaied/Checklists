//
//  ViewController.swift
//  Checklists
//
//  Created by lpiem on 14/02/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit




class ChecklistViewController : UITableViewController {
   var itemToEdit : ChecklistItem? = nil
  var tabCheckListItem=[ChecklistItem]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabCheckListItem.append(ChecklistItem(message: "test"))
        tabCheckListItem.append(ChecklistItem(message: "Test",verif: true))
        tabCheckListItem.append(ChecklistItem(message: "MATCH",verif: true))
    }
    
    @IBAction func addDummytoDo(_ sender: Any) {
        tabCheckListItem.append(ChecklistItem(message: "Dummy",verif: true))
        
        tableView.reloadData()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tabCheckListItem.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.tabCheckListItem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //cell.textLabel?.text = "message"
        
        
        configureText(for: cell as! ChecklistItemCell, withItem: tabCheckListItem[indexPath.row])
        configureCheckmark(for: cell as! ChecklistItemCell, withItem: tabCheckListItem[indexPath.row])
   
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let navVC = segue.destination as! UINavigationController
//
//        let destVC=navVC.topViewController as! AddItemViewController
//
//        destVC.delegate=self
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addItem"){
            let navigation = segue.destination as! UINavigationController
            let delegateVC = navigation.topViewController as! ItemDetailViewController
            delegateVC.itemToEdit = nil
            delegateVC.delegate = self
        }
        else if (segue.identifier == "editItem"){
            let nav = segue.destination as! UINavigationController
            let delegateVC = nav.topViewController as! ItemDetailViewController
            let cell = sender as! ChecklistItemCell
            let index = tableView.indexPath(for: cell)
            itemToEdit = tabCheckListItem[index!.row]
            
            delegateVC.itemToEdit = itemToEdit
            delegateVC.delegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabCheckListItem[indexPath.row].toggleChecked()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func configureCheckmark(for cell: ChecklistItemCell, withItem item: ChecklistItem){
        cell.checkLabel.isHidden = !item.verif
        
        
    }
    func configureText(for cell: ChecklistItemCell, withItem item: ChecklistItem){
        cell.TaskLabel.text=item.message
    }
    
    
    
    
    
   
   
}

extension ChecklistViewController : AddItemViewControllerDelegate{
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController) {
            dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem) {
      
        
        print("Ok",item.message)
        item.verif=false
        
        
        tabCheckListItem.append(ChecklistItem(message: item.message))
        tableView.insertRows(at: [IndexPath(row: tabCheckListItem.count - 1, section: 0)], with: UITableView.RowAnimation.automatic)
             tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    
    func addItemViewController(_ controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
 {
        
    print("new text",item.message)
    
    tableView.reloadRows(at: [IndexPath(row: tabCheckListItem.firstIndex(where: { $0 === item })!, section: 0)], with: UITableView.RowAnimation.automatic)
    tableView.reloadData()
    dismiss(animated: true, completion: nil)
    }
    
    
    
}
