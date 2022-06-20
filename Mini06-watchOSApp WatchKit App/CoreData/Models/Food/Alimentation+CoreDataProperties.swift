//
//  Alimentation+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Alimentation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alimentation> {
        return NSFetchRequest<Alimentation>(entityName: "Alimentation")
    }

    @NSManaged public var breakCount: Int64
    @NSManaged public var id: UUID?
    @NSManaged public var point: Int64
    @NSManaged public var waterCount: Int64
    @NSManaged public var alimentationCategory: NSSet?
    @NSManaged public var dailyGeneral: DailyGeneral?
    @NSManaged public var meal: NSSet?

}

// MARK: Generated accessors for alimentationCategory
extension Alimentation {

    @objc(addAlimentationCategoryObject:)
    @NSManaged public func addToAlimentationCategory(_ value: AlimentationCategory)

    @objc(removeAlimentationCategoryObject:)
    @NSManaged public func removeFromAlimentationCategory(_ value: AlimentationCategory)

    @objc(addAlimentationCategory:)
    @NSManaged public func addToAlimentationCategory(_ values: NSSet)

    @objc(removeAlimentationCategory:)
    @NSManaged public func removeFromAlimentationCategory(_ values: NSSet)

}

// MARK: Generated accessors for meal
extension Alimentation {

    @objc(addMealObject:)
    @NSManaged public func addToMeal(_ value: Meal)

    @objc(removeMealObject:)
    @NSManaged public func removeFromMeal(_ value: Meal)

    @objc(addMeal:)
    @NSManaged public func addToMeal(_ values: NSSet)

    @objc(removeMeal:)
    @NSManaged public func removeFromMeal(_ values: NSSet)

}

extension Alimentation : Identifiable {

}
