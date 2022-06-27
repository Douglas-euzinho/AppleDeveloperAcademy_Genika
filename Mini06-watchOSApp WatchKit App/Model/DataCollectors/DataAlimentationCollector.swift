//
//  DataAlimentationCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorAlimentationCategory {
    let alimentationCategory: String
    let quantifier: Int
    
    init(alimentationCategory: String, quantifier: Int){
        self.alimentationCategory = alimentationCategory
        self.quantifier = quantifier
    }
}

struct DataCollectorMealCategory {
    let category: String
    let hourMeal: Date
    let quantifier: Int
    
    init(category: String, hourMeal: Date, quantifier: Int){
        self.category = category
        self.hourMeal = hourMeal
        self.quantifier = quantifier
    }
}

struct DataCollectorAlimentation {

    var alimentationCategory: [DataCollectorAlimentationCategory] = []
    var mealCategory: [DataCollectorMealCategory] = []
    var waterCount: Int = 0
    var breakCount: Int = 0
    var point: Int = 0
    
    
//    mutating func setAlimentationCategoryArray(types:[String]) {
//        for category in types{
//            alimentationCategory.append(DataCollectorAlimentationCategory(alimentationCategory: category, quantifier: 2))
//        }
//    }
    
    mutating func setAlimentationCategoryArray(category: String, quantifier: Int) {
        alimentationCategory.append(DataCollectorAlimentationCategory(alimentationCategory: category, quantifier: quantifier))
        print("$$$$$$$$$$$", alimentationCategory)
    }
    
    mutating func setMealCategoryArray(category: String, quantifier: Int) {
        mealCategory.append(DataCollectorMealCategory(category: category, hourMeal: Date.now, quantifier: quantifier))
        print("##########", mealCategory)
    }
    
//    mutating func setMealCategoryArray(types:[String]) {
//        for category in types{
//            mealCategory.append(DataCollectorMealCategory(category: category))
//        }
//    }
    
    
    internal func sendData() -> Alimentation {
        var persistence = PersistenceController.shared

        do {
            let alimentation = try persistence.alimentation(breakCount: breakCount, point: point, waterCount: waterCount, alimentationCategory: alimentationCategory, meal: mealCategory)
            return alimentation
        } catch {
            return Alimentation()
        }
    }
}
