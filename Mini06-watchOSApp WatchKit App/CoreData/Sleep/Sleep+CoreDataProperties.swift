//
//  Sleep+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Vitor Souza on 30/06/22.
//
//

import Foundation
import CoreData


extension Sleep {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sleep> {
        return NSFetchRequest<Sleep>(entityName: "Sleep")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var timeSleeping: Double
    @NSManaged public var timesWakeUp: Int64
    @NSManaged public var dailyGeneral: DailyGeneral?

}

extension Sleep : Identifiable {

}
