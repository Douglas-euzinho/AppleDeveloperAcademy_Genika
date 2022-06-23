//
//  DataAlimentationCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorAlimentationCategory {
    var alimentationCategory: String?
    var quantifier: Int = 0
}

struct DataCollectorMealCategory {
    var category: String?
    var hourMeal: Date?
    var quantifier: Int?
}

struct DataCollectorAlimentation {

    var alimentationCategory: [DataCollectorAlimentationCategory] = []
    var mealCategory: [DataCollectorMealCategory] = []
    var waterCount: Int?
    var breakCount: Int?
    var point: Int?
    
    
    mutating func setAlimentationCategoryArray(types:[String]) {
        for category in types{
            alimentationCategory.append(DataCollectorAlimentationCategory(alimentationCategory: category))
        }
    }
    mutating func setMealCategoryArray(types:[String]) {
        for category in types{
            mealCategory.append(DataCollectorMealCategory(category: category))
        }
    }
}
