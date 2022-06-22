//
//  DataEmotionalCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorEmojiCategory {
    var category: String?
    private var quantifier: Int = 0
    
}

struct DataCollectorEmotional {
    
    var emojiCategory: DataCollectorEmojiCategory = DataCollectorEmojiCategory()
    var intensity: Int?
    var score: Int?
    
    mutating func getFeeling(feeling:String){
        emojiCategory.category = feeling
    }
    
    mutating func getIntesity(value:Int){
        intensity = value
    }
}
