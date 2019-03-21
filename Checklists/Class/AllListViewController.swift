//
//  AllListViewController.swift
//  Checklists
//
//  Created by lpiem on 21/03/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit



class AllListViewController : UITableViewController {
    
    var documentDirectory : URL {
        get {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }
    }
    var dataFileUrl : URL {
        get {
            let fileUrl = documentDirectory.appendingPathComponent("Checklists").appendingPathExtension("json")
            return fileUrl
        }
    }
    

      var tabCheckListItem=[ChecklistItem]()
      var tabCheckListItem2=[ChecklistItem]()
      var tabCheckListItem3=[ChecklistItem]()
      var lists=[Checklist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabCheckListItem.append(ChecklistItem(message: "liste1"))
        tabCheckListItem.append(ChecklistItem(message: "liste2",verif: true))
        tabCheckListItem.append(ChecklistItem(message: "liste3",verif: true))
        
        
        tabCheckListItem2.append(ChecklistItem(message: "liste4"))
        tabCheckListItem2.append(ChecklistItem(message: "liste5",verif: true))
        tabCheckListItem2.append(ChecklistItem(message: "liste6",verif: true))
        
        
        tabCheckListItem3.append(ChecklistItem(message: "liste7"))
        tabCheckListItem3.append(ChecklistItem(message: "liste8",verif: true))
        tabCheckListItem3.append(ChecklistItem(message: "liste9",verif: true))
        
        let liste1=Checklist.init(name: "listeA",items:tabCheckListItem)
        let liste2=Checklist.init(name: "listeB",items:tabCheckListItem2)
        let liste3=Checklist.init(name: "liste3",items:tabCheckListItem3)
        
        lists.append(liste1)
        lists.append(liste2)
        lists.append(liste3)
        
   
        
            

             saveChecklist()



        
         loadChecklist()
        //tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tabCheckListItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItems", for: indexPath)
        cell.textLabel?.text = tabCheckListItem[indexPath.row].message
       saveChecklist()
    
        return cell
    }
    
    
    func saveChecklist() {
        print("Save")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try! encoder.encode(lists)
        try! data.write(to: dataFileUrl)
    }
    
    
    func loadChecklist() {
        do{
            let jsonFile = try Data.init(contentsOf: dataFileUrl)
            let decoder = JSONDecoder()
            let data = try decoder.decode([Checklist].self, from: jsonFile)
            lists = data
        }
        catch{}
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let delegateVC = segue.destination as! ChecklistViewController
        let cell = sender
        let index = tableView.indexPath(for: cell as! UITableViewCell)
        let list = lists[index!.row]
        delegateVC.list = list
    }}
