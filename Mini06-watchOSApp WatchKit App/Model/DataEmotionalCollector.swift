//
//  DataEmotionalCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorEmojiCategory {
    var category: String?
    var quantifier: Int = 0
    
}

struct DataCollectorEmotional {
    
    var emojiCategory: DataCollectorEmojiCategory = DataCollectorEmojiCategory()
    var intensity: Int?
    var score: Int?
    
    mutating func setFeeling(feeling:String){
        emojiCategory.category = feeling
    }
    
    mutating func setIntesity(value:Int){
        intensity = value
    }
}
