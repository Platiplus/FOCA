//
//  Usuario+CoreDataProperties.swift
//  FOCA_App
//
//  Created by Platiplus on 28/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var disponibilidade: Int16
    @NSManaged public var id: Int16
    @NSManaged public var inaugural: Bool
    @NSManaged public var nome: String?
    @NSManaged public var senha: String?
    @NSManaged public var user: String?
    @NSManaged public var materias: NSSet?

}

// MARK: Generated accessors for materias
extension Usuario {

    @objc(addMateriasObject:)
    @NSManaged public func addToMaterias(_ value: Materia)

    @objc(removeMateriasObject:)
    @NSManaged public func removeFromMaterias(_ value: Materia)

    @objc(addMaterias:)
    @NSManaged public func addToMaterias(_ values: NSSet)

    @objc(removeMaterias:)
    @NSManaged public func removeFromMaterias(_ values: NSSet)

}
