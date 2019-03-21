//
//  ChecklistItem.swift
//  Checklists
//
//  Created by lpiem on 14/02/2019.
//  Copyright © 2019 lpiem. All rights reserved.
//

import UIKit

class ChecklistItem : Codable
{
    var message :String
    var verif   :Bool
    
    init(message: String, verif: Bool=false){
        self.message=message
        self.verif=verif
        
        
    }
    
    func toggleChecked (){
       verif = !verif
    }
  
}


