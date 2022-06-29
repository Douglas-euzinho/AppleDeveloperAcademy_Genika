//
//  PersistenceController+Alimentation.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation
import CoreData

extension PersistenceController {
    
    //FUNC TO SAVE THE ALIMENTATION CATEGORY
     mutating func alimentationCategory(category: String, quantifier: Int) throws -> AlimentationCategory {
        let alimentationCategory = AlimentationCategory(context: context)
        alimentationCategory.category = category
        alimentationCategory.quantifier = Int64(quantifier)

        try saveContext()
        return alimentationCategory
    }
    
    //FUNC TO GET THE ALIMENTATION CATEGORY
    mutating func getAlimentationCategory() -> [AlimentationCategory] {
        let fetch: NSFetchRequest<AlimentationCategory> = AlimentationCategory.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
    
    //FUNC TO SAVE THE MEAL
    mutating func meal(category: String, hourMeal: Date, quantifier: Int) throws -> Meal{
        let meal = Meal(context: context)
        meal.category = category
        meal.hourMeal = hourMeal
        meal.quantifier = Int64(quantifier)

        try saveContext()
        return meal
    }
    
    //FUNC TO GET THE MEAL
    mutating func getMeal() -> [Meal] {
        let fetch: NSFetchRequest<Meal> = Meal.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
    
    //FUNC TO SAVE THE ALIMENTATION
    mutating func alimentation(breakCount: Int, point: Int, waterCount: Int, alimentationCategory: [DataCollectorAlimentationCategory], meal: [DataCollectorMealCategory]) throws -> Alimentation {
        let alimentation = Alimentation(context: context)
        alimentation.breakCount = Int64(breakCount)
        alimentation.point = Int64(point)
        alimentation.waterCount = Int64(waterCount)
        
        alimentationCategory.forEach { ali in
            let category = AlimentationCategory(context: context)
            category.alimentation = alimentation
            category.category = ali.alimentationCategory
            category.quantifier = Int64(ali.quantifier)
            alimentation.alimentationCategory?.adding(category)
        }
        
        meal.forEach { ml in
            let category = Meal(context: context)
            category.alimentation = alimentation
            category.category = ml.category
            category.quantifier = Int64(ml.quantifier)
            category.hourMeal = ml.hourMeal
            alimentation.meal?.adding(category)
        }

        try saveContext()
        return alimentation
    }
    
    //FUNC TO GET THE ALIMENTATION
    func getAlimentations() -> [Alimentation] {
        let fetch: NSFetchRequest<Alimentation> = Alimentation.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
}
