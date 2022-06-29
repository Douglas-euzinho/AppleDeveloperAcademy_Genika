//
//  PersistenceController+Emotional.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation
import CoreData

extension PersistenceController {
    
    //FUNC TO SAVE THE EMOJI CATEGORY
    mutating func emojiCategory(category: String, quantifier: Int) throws -> EmojiCategory{
        let emojiCategory = EmojiCategory(context: context)
        emojiCategory.category = category
        emojiCategory.quantifier = Int64(quantifier)
        
        try saveContext()
        return emojiCategory
    }
    
    //FUNC TO GET THE EMOJI CATEGORY
    func getEmojiCategory() -> [EmojiCategory] {
        let fetch: NSFetchRequest<EmojiCategory> = EmojiCategory.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }

    //FUNC TO SAVE THE EMOTIONAL
    mutating func emotional(intensity: Int, score: Int, emojiCategory: EmojiCategory) throws -> Emotional {
        let emotional = Emotional(context: context)
        emotional.intensity = Int64(intensity)
        emotional.score = Int64(score)

        emojiCategory.emotional = emotional

        try saveContext()
        return emotional
    }
    
    //FUNC TO GET THE EMOTIONAL
    func getEmotional() -> [Emotional] {
        let fetch: NSFetchRequest<Emotional> = Emotional.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
}
