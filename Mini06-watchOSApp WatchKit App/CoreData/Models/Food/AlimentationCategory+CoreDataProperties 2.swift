//
//  AlimentationCategory+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension AlimentationCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlimentationCategory> {
        return NSFetchRequest<AlimentationCategory>(entityName: "AlimentationCategory")
    }

    @NSManaged public var category: String?
    @NSManaged public var quantifier: Int64
    @NSManaged public var alimentation: Alimentation?

}

extension AlimentationCategory : Identifiable {

}
