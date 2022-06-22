//
//  DataAlimentationCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorAlimentationCategory {
    var alimentationCategory: String?
    var quantifier: Int?
}

struct DataCollectorMealCategory {
    var category: String?
    var hourMeal: Date?
    var quantifier: Int?
}

struct DataCollectorAlimentation {

    var alimentationCategory: [DataCollectorAlimentationCategory]?
    var mealCategory: [DataCollectorMealCategory]?
    var waterCount: Int?
    var breakCount: Int?
    var point: Int?
    
}
