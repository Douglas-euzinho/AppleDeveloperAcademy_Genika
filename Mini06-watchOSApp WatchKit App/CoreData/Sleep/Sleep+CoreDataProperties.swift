//
//  Sleep+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Sleep {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sleep> {
        return NSFetchRequest<Sleep>(entityName: "Sleep")
    }

    @NSManaged public var finalSleepHour: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var initialSleepHour: Date?
    @NSManaged public var score: Int64
    @NSManaged public var timeInBed: Date?
    @NSManaged public var timeSleeping: Date?
    @NSManaged public var timesWakeUp: Int64
    @NSManaged public var dailyGeneral: DailyGeneral?

}

extension Sleep : Identifiable {

}
