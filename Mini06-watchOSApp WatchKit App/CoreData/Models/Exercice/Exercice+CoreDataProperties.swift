//
//  Exercice+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Exercice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercice> {
        return NSFetchRequest<Exercice>(entityName: "Exercice")
    }

    @NSManaged public var countSteps: Int64
    @NSManaged public var didExercice: Bool
    @NSManaged public var distanceWalked: Float
    @NSManaged public var id: UUID?
    @NSManaged public var kcalLost: Int64
    @NSManaged public var bpm: NSSet?
    @NSManaged public var dailyGeneral: DailyGeneral?

}

// MARK: Generated accessors for bpm
extension Exercice {

    @objc(addBpmObject:)
    @NSManaged public func addToBpm(_ value: Bpm)

    @objc(removeBpmObject:)
    @NSManaged public func removeFromBpm(_ value: Bpm)

    @objc(addBpm:)
    @NSManaged public func addToBpm(_ values: NSSet)

    @objc(removeBpm:)
    @NSManaged public func removeFromBpm(_ values: NSSet)

}

extension Exercice : Identifiable {

}
