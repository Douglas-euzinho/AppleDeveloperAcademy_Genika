//
//  DataAlimentationCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 21/06/22.
//

import Foundation

struct DataCollectorAlimentationCategory: Equatable {
    let alimentationCategory: String
    let quantifier: Int
    
    init(alimentationCategory: String, quantifier: Int) {
        self.alimentationCategory = alimentationCategory
        self.quantifier = quantifier
    }
    
    static func ==(lhs: DataCollectorAlimentationCategory, rhs: DataCollectorAlimentationCategory) -> Bool {
        return lhs.alimentationCategory == rhs.alimentationCategory
    }
}

struct DataCollectorMealCategory: Equatable {
    let category: String
    let hourMeal: Date
    let quantifier: Int
    
    init(category: String, hourMeal: Date, quantifier: Int) {
        self.category = category
        self.hourMeal = hourMeal
        self.quantifier = quantifier
    }
    
    static func ==(lhs: DataCollectorMealCategory, rhs: DataCollectorMealCategory) -> Bool {
        return lhs.category == rhs.category
    }
}

struct DataCollectorAlimentation {
    var alimentationCategories: [DataCollectorAlimentationCategory] = []
    var mealCategories: [DataCollectorMealCategory] = []
    var waterCount: Int = 0
    var breakCount: Int = 0
    var point: Int = 0
    
    mutating func setAlimentationCategoryArray(_ categories: [DataCollectorAlimentationCategory]) {
        alimentationCategories.append(contentsOf: categories)
    }
    
    mutating func setAlimentationCategory(category: String, quantifier: Int) {
        alimentationCategories.append(DataCollectorAlimentationCategory(alimentationCategory: category, quantifier: quantifier))
        point += quantifier
    }
    
    mutating func setMealCategoryArray(_ categories: [DataCollectorMealCategory]) {
        mealCategories.append(contentsOf: categories)
    }
    
    mutating func setMealCategory(category: String, quantifier: Int) {
        mealCategories.append(DataCollectorMealCategory(category: category, hourMeal: Date.now, quantifier: quantifier))
    }
    
    func saveData() throws -> Alimentation {
        var persistence = PersistenceController.shared

        return try persistence.alimentation(breakCount: breakCount,
                                            point: point,
                                            waterCount: waterCount,
                                            alimentationCategory: alimentationCategories,
                                            meal: mealCategories)
    }
}
