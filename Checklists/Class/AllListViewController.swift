//
//  AllListViewController.swift
//  Checklists
//
//  Created by lpiem on 21/03/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit



class AllListViewController : UITableViewController {

      var tabCheckListItem=[ChecklistItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabCheckListItem.append(ChecklistItem(message: "test"))
        tabCheckListItem.append(ChecklistItem(message: "Test",verif: true))
        tabCheckListItem.append(ChecklistItem(message: "MATCH",verif: true))
        //  loadChecklistItems()
        //tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tabCheckListItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItems", for: indexPath)
        cell.textLabel?.text = tabCheckListItem[indexPath.row].message
        
        
        return cell
    }
}
