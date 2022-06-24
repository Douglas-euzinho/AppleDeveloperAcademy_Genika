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
    let hourMeal: Date = Date.now
    var quantifier: Int = 0
    
    init(category: String){
        self.category = category
    }
}

struct DataCollectorAlimentation {

    var alimentationCategory: [DataCollectorAlimentationCategory] = []
    //var teste: DataCollectorAlimentationCategory
    var mealCategory: [DataCollectorMealCategory] = []
    var waterCount: Int = 0
    var breakCount: Int = 0
    var point: Int = 0
    
    
    mutating func setAlimentationCategoryArray(types:[String]) {
        for category in types{
            alimentationCategory.append(DataCollectorAlimentationCategory(alimentationCategory: category, quantifier: 2))
        }
    }
    
//    mutating func setAlimentationCategory(category: String, quantifier: Int) {
//        alimentationCategory.append(DataCollectorAlimentationCategory(alimentationCategory: category, quantifier: quantifier))
//    }
    
    mutating func setMealCategoryArray(types:[String]) {
        for category in types{
            mealCategory.append(DataCollectorMealCategory(category: category))
        }
    }
    
    internal func sendAlimentationCategory() -> AlimentationCategory {
        var persistence = PersistenceController.shared
        
        do {
            for i in 0...alimentationCategory.count {
                print("ENTROU")
                let alimentationCategory = try persistence.alimentationCategory(category: alimentationCategory[i].alimentationCategory, quantifier: alimentationCategory[i].quantifier)
                return alimentationCategory
            }
        } catch {
            //TODO: tratar erro
        }
        return AlimentationCategory()
    }
    
//    internal func sendData() -> Alimentation {
//        var persistence = PersistenceController.shared
//
//        do {
//            let alimentation: Alimentation
//            for i in 0...alimentationCategory.count {
//                alimentation = try persistence.alimentation(breakCount: breakCount, point: point, waterCount: waterCount, alimentationCategory: persistence.alimentationCategory(category: alimentationCategory[i].alimentationCategory, quantifier: alimentationCategory[i].quantifier))
//            }
//        } catch {
//            return Alimentation()
//        }
//        return
//    }
}
