//
//  Emotional+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension Emotional {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emotional> {
        return NSFetchRequest<Emotional>(entityName: "Emotional")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var intensity: Int64
    @NSManaged public var score: Int64
    @NSManaged public var dailyGeneral: DailyGeneral?
    @NSManaged public var emojiCategory: EmojiCategory?

}

extension Emotional : Identifiable {

}
