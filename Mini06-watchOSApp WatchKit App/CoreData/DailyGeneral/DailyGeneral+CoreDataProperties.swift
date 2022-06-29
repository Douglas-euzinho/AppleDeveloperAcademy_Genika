//
//  DailyGeneral+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension DailyGeneral {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyGeneral> {
        return NSFetchRequest<DailyGeneral>(entityName: "DailyGeneral")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var alimentation: Alimentation?
    @NSManaged public var emotional: Emotional?
    @NSManaged public var exercice: Exercice?
    @NSManaged public var sleep: Sleep?

}

extension DailyGeneral : Identifiable {

}
