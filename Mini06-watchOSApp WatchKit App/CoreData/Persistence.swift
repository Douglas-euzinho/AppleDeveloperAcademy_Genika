//
//  Persistence.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 20/06/22.
//

import CoreData
import SwiftUI

struct PersistenceController {
    static var shared = PersistenceController()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "General")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
            }
        }
        return container
    }()

    lazy var context: NSManagedObjectContext = {
        let viewContext = persistenceContainer.viewContext
        viewContext.automaticallyMergesChangesFromParent = true
        return viewContext
    }()

    let persistenceContainer: NSPersistentContainer

    init(inMemory: Bool = false){
        persistenceContainer = NSPersistentContainer(name: "CoreData")
        if inMemory{
            persistenceContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        persistenceContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                print("deu ruim", error)
            }
        }
    }
    
    //MARK: DAILY GENERAL METHODS
    //FUNC TO SAVE THE DAILY GENERAL
    mutating func dailyGeneral(alimentation: Alimentation, emotional: Emotional) throws -> DailyGeneral {
       let dailyGeneral = DailyGeneral(context: context)
        dailyGeneral.date = Date.now
        
        dailyGeneral.alimentation = alimentation
        dailyGeneral.emotional = emotional
        
//        alimentationArray.forEach { alimentation in
//            dailyGeneral.alimentation =
//        }
        
//        emotionalArray.forEach { emotional in
//            dailyGeneral.emotional = emotional
//        }
        
//        alimentationArray.forEach { ali in
//            let category = Alimentation(context: context)
//
//            category.dailyGeneral = dailyGeneral
//        }
        


        
        try saveContext()
        return dailyGeneral
    }
    
    //FUNC TO GET THE DAILY GENERAL
    mutating func getDailyGeneral() -> [DailyGeneral] {
        let fetch: NSFetchRequest<DailyGeneral> = DailyGeneral.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }

    //MARK: ALIMENTATION METHODS
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



    //MARK: EMOTIONAL METHODS
    //FUNC TO SAVE THE EMOJI CATEGORY
    mutating func emojiCategory(category: String, quantifier: Int) throws -> EmojiCategory{
        let emojiCategory = EmojiCategory(context: context)
        emojiCategory.category = category
        emojiCategory.quantifier = Int64(quantifier)
        
        try saveContext()
        return emojiCategory
    }
    
    //FUNC TO GET THE EMOJI CATEGORY
    func getEmojiCategory() -> [EmojiCategory] {
        let fetch: NSFetchRequest<EmojiCategory> = EmojiCategory.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }

    //FUNC TO SAVE THE EMOTIONAL
    mutating func emotional(intensity: Int, score: Int, emojiCategory: EmojiCategory) throws -> Emotional {
        let emotional = Emotional(context: context)
        emotional.intensity = Int64(intensity)
        emotional.score = Int64(score)

        emojiCategory.emotional = emotional

        try saveContext()
        return emotional
    }
    
    //FUNC TO GET THE EMOTIONAL
    func getEmotional() -> [Emotional] {
        let fetch: NSFetchRequest<Emotional> = Emotional.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }

    //MARK: CORE DATA METHODS
    mutating func saveContext() throws{
        if context.hasChanges{
            do{
                try context.save()
                debugPrint(SucessType.sucessSaving)
            } catch {
                debugPrint(ErrorType.notSaved)
            }
        }
    }

    mutating func deleteObjectIndex(object: NSManagedObject) -> Bool{
        context.delete(object)
        do{
            try saveContext()
            debugPrint(SucessType.sucessDeleting)
            return true
        } catch{
            debugPrint(ErrorType.notDeleted)
            return false
        }
    }
}




//    init(){
//        persistenceContainer = NSPersistentContainer(name: "CoreData")
//        persistenceContainer.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                print("deu ruim", error)
//            }
//            print("entrou aqui?")
//        }
//    }

//func emojiCategory(category: String, quantifier: Int) -> EmojiCategory{
//        let emojiCategory = EmojiCategory(context: persistenceContainer.viewContext)
//        emojiCategory.category = category
//        emojiCategory.quantifier = Int64(quantifier)
//
//        do{
//            try persistenceContainer.viewContext.save()
//        } catch {
//            //TODO: TRATAR ERRO
//        }
//        return emojiCategory
//    }
//
//    mutating func fetchEmojiCategory() -> [EmojiCategory]{
//        var emojis: [EmojiCategory] = []
//
//        do {
//            emojis = try
//            context.fetch(EmojiCategory.fetchRequest())
//        } catch{
//            debugPrint(FetchError.errorEmoji)
//        }
//
//        return emojis
//    }
