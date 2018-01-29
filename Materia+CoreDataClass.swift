//
//  Materia+CoreDataClass.swift
//  FOCA_App
//
//  Created by Platiplus on 28/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import CoreData


public class Materia: NSManagedObject {

    convenience init(){
        let classStringName = String(describing: Materia.self)
        let entityDescription = NSEntityDescription.entity(forEntityName: classStringName, in: CoreDataManager.sharedManager().getContext())
        self.init(entity:entityDescription!, insertInto: CoreDataManager.sharedManager().getContext())
        print("materia inicializada")
    }
    
}
