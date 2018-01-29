//
//  Topico+CoreDataProperties.swift
//  FOCA_App
//
//  Created by Platiplus on 28/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import CoreData


extension Topico {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topico> {
        return NSFetchRequest<Topico>(entityName: "Topico")
    }

    @NSManaged public var anotacao: String?
    @NSManaged public var dificuldade: Int16
    @NSManaged public var id: Int16
    @NSManaged public var nome: String?
    @NSManaged public var status: Bool
    @NSManaged public var tempo: Int16
    @NSManaged public var materia: Materia?

}
