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
}
