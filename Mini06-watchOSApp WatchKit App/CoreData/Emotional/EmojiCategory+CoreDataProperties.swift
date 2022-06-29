//
//  EmojiCategory+CoreDataProperties.swift
//  Mini06-watchOSApp
//
//  Created by Lucas Alexandre Amorim Leoncio on 20/06/22.
//
//

import Foundation
import CoreData


extension EmojiCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmojiCategory> {
        return NSFetchRequest<EmojiCategory>(entityName: "EmojiCategory")
    }

    @NSManaged public var category: String?
    @NSManaged public var quantifier: Int64
    @NSManaged public var emotional: Emotional?

}

extension EmojiCategory : Identifiable {

}
