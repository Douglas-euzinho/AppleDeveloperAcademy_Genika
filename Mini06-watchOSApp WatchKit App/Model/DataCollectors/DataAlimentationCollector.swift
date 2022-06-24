//
//  DataAlimentationCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorAlimentationCategory {
    let alimentationCategory: String
    private(set) var quantifier: Int = 0
    
    init(alimentationCategory: String){
        self.alimentationCategory = alimentationCategory
    }
}

struct DataCollectorMealCategory {
    let category: String
    let hourMeal: Date = Date.now
    var quantifier: Int = 0
    
    init(category: String){
        self.category = category
    }
}

struct DataCollectorAlimentation {

    var alimentationCategory: [DataCollectorAlimentationCategory] = []
    var mealCategory: [DataCollectorMealCategory] = []
    var waterCount: Int = 0
    var breakCount: Int = 0
    var point: Int = 0
    
    
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
