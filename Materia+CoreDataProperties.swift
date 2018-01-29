//
//  Materia+CoreDataProperties.swift
//  FOCA_App
//
//  Created by Platiplus on 28/11/17.
//  Copyright © 2017 Platiplus. All rights reserved.
//

import Foundation
import CoreData


extension Materia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Materia> {
        return NSFetchRequest<Materia>(entityName: "Materia")
    }

    @NSManaged public var id: Int16
    @NSManaged public var nome: String?
    @NSManaged public var status: Bool
    @NSManaged public var tempo: Int16
    @NSManaged public var user: String?
    @NSManaged public var interno: Bool
    @NSManaged public var topicos: NSSet?
    @NSManaged public var usuario: Usuario?

}

// MARK: Generated accessors for topicos
extension Materia {

    @objc(addTopicosObject:)
    @NSManaged public func addToTopicos(_ value: Topico)

    @objc(removeTopicosObject:)
    @NSManaged public func removeFromTopicos(_ value: Topico)

    @objc(addTopicos:)
    @NSManaged public func addToTopicos(_ values: NSSet)

    @objc(removeTopicos:)
    @NSManaged public func removeFromTopicos(_ values: NSSet)

}
