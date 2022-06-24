//
//  DataEmotionalCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorEmojiCategory {
    let category: String
    private(set) var quantifier: Int = 0

    init(category: String){
        self.category = category
    }
}

struct DataCollectorEmotional {
    
    var emojiCategory: DataCollectorEmojiCategory
    var intensity: Int = 0
    var score: Int = 0
    
    mutating func setFeeling(feeling:String){
        emojiCategory = DataCollectorEmojiCategory(category: feeling)
    }
    
    mutating func setIntesity(value:Int){
        intensity = value
    }
    
    internal func sendData() -> Emotional{
        var persistence = PersistenceController.shared
        
        do{
            let emotional = try persistence.emotional(intensity: intensity, score: score, emojiCategory: persistence.emojiCategory(category: emojiCategory.category, quantifier: emojiCategory.quantifier))
            return emotional
        } catch{
            //TODO: tratar erro
        }
        return Emotional()
    }
}
