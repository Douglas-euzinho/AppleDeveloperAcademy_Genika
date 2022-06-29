//
//  Bpm+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Bpm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bpm> {
        return NSFetchRequest<Bpm>(entityName: "Bpm")
    }

    @NSManaged public var average: Int64
    @NSManaged public var inActivity: Int64
    @NSManaged public var inRest: Int64
    @NSManaged public var exercice: Exercice?

}

extension Bpm : Identifiable {

}
