//
//  Meal+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var category: String?
    @NSManaged public var hourMeal: Date?
    @NSManaged public var quantifier: Int64
    @NSManaged public var alimentation: Alimentation?

}

extension Meal : Identifiable {

}
