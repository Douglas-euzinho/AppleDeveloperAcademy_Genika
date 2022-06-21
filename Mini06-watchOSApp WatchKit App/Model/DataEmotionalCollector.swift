//
//  DataEmotionalCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorEmojiCategory {
    var category: String
    var quantifier: Int
}

struct DataCollectorEmotional: ProtocolDataCollector {
    
    var emojiCategory: DataCollectorEmojiCategory?
    var intensity: Int
    var score: Int
    
    func sendToCoreData() {
        var shared = PersistenceController.shared
        
        let emotional = Emotional(context: shared.context)
        
        emotional.emojiCategory?.quantifier = Int64((self.emojiCategory?.quantifier)!)
        emotional.emojiCategory?.category = self.emojiCategory?.category
        
        shared.emotional(id: 1, intensity: self.intensity, score: self.score, emojiCategory: emojiCategory)
    }
}
