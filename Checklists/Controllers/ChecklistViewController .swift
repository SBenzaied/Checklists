//
//  ViewController.swift
//  Checklists
//
//  Created by lpiem on 14/02/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit




class ChecklistViewController : UITableViewController {
    
  var tabCheckListItem=[ChecklistItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabCheckListItem.append(ChecklistItem(message: "test"))
        tabCheckListItem.append(ChecklistItem(message: "Test",verif: true))
        tabCheckListItem.append(ChecklistItem(message: "MATCH",verif: true))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tabCheckListItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        //cell.textLabel?.text = "message"
        
        
        configureText(for: cell, withItem: tabCheckListItem[indexPath.row])
        configureCheckmark(for: cell, withItem: tabCheckListItem[indexPath.row])
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, withItem item: ChecklistItem){
        if item.verif == false{
            cell.accessoryType = .none
        }
        else{cell.accessoryType = .checkmark}
        
        
    }
    func configureText(for cell: UITableViewCell, withItem item: ChecklistItem){
        cell.textLabel?.text=item.message
    }
    
    
    
    
   
   
}

