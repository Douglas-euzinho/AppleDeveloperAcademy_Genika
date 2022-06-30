//
//  DataEmotionalCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorEmojiCategory {
    let category: String
    let quantifier: Int

    init(category: String, quantifier: Int) {
        self.category = category
        self.quantifier = quantifier
    }
}

struct DataCollectorEmotional {
    var emojiCategory: DataCollectorEmojiCategory
    var intensity: Int = 0
    var score: Int = 0
    
    mutating func setFeeling(feeling: String, quantifier: Int) {
        emojiCategory = DataCollectorEmojiCategory(category: feeling,
                                                   quantifier: quantifier)
    }
    
    mutating func setIntesity(value: Int) {
        intensity = value
    }
    
    mutating func calculateScore() {
        score = intensity * emojiCategory.quantifier
    }
    
    func saveData() throws -> Emotional {
        var persistence = PersistenceController.shared
        
        let emojiCategory = try persistence.emojiCategory(category: emojiCategory.category,
                                                          quantifier: emojiCategory.quantifier)
        
        return try persistence.emotional(intensity: intensity,
                                         score: score,
                                         emojiCategory: emojiCategory)
    }
}
