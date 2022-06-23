//
//  Persistence.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 20/06/22.
//

import CoreData

class PersistenceController {
    static var shared = PersistenceController()
//
////    lazy var persistentContainer: NSPersistentContainer = {
////        let container = NSPersistentContainer(name: "General")
////        container.loadPersistentStores { _, error in
////            if let error = error as NSError? {
////                //tratar o erro dps
////            }
////        }
////        return container
////    }()
//
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
                debugPrint(error)
            }
        }
    }
//
//    //MARK: ALIMENTATION METHODS
//     func alimentationCategory(category: String, quantifier: Int) throws -> AlimentationCategory {
//        let alimentationCategory = AlimentationCategory(context: context)
//        alimentationCategory.category = category
//        alimentationCategory.quantifier = Int64(quantifier)
//
//        try saveContext()
//        return alimentationCategory
//    }
//
//    mutating func fetchAlimentationCategory() -> [AlimentationCategory] {
//        var alimentationCategorys: [AlimentationCategory] = []
//
//        do{
//            alimentationCategorys = try
//            context.fetch(AlimentationCategory.fetchRequest())
//        } catch {
//            //CoreDataError.fetchError(error.localizedDescription)
//        }
//
//        return alimentationCategorys
//    }
//
//    mutating func meal(category: String, hourMeal: Date, quantifier: Int) throws -> Meal{
//        let meal = Meal(context: context)
//        meal.category = category
//        meal.hourMeal = hourMeal
//        meal.quantifier = Int64(quantifier)
//
//        try saveContext()
//        return meal
//    }
//
//    mutating func fetchMeal() -> [Meal] {
//        var meals: [Meal] = []
//
//        do{
//            meals = try
//            context.fetch(Meal.fetchRequest())
//        } catch {
//            debugPrint(FetchError.errorAlimentation)
//        }
//
//        return meals
//    }
//
//    mutating func alimentation(breakCount: Int, id: UUID, point: Int, waterCount: Int, alimentationCategory: AlimentationCategory, meal: Meal) throws -> Alimentation {
//        let alimentation = Alimentation(context: context)
//        alimentation.breakCount = Int64(breakCount)
//        alimentation.id = id
//        alimentation.point = Int64(point)
//        alimentation.waterCount = Int64(waterCount)
//
//        alimentationCategory.alimentation = alimentation
//        meal.alimentation = alimentation
//
//        try saveContext()
//        return alimentation
//    }
//
//
//
//
    //MARK: EMOTIONAL METHODS
    func emojiCategory(category: String, quantifier: Int) -> EmojiCategory{
        let emojiCategory = EmojiCategory(context: persistenceContainer.viewContext)
        emojiCategory.category = category
        emojiCategory.quantifier = Int64(quantifier)

        do{
//            try saveContext()
            try persistenceContainer.viewContext.save()
        } catch {
            //TODO: TRATAR ERRO
        }
        return emojiCategory
    }
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
//
//    mutating func emotional(intensity: Int, score: Int, emojiCategory: EmojiCategory) throws -> Emotional {
//        let emotional = Emotional(context: context)
//        emotional.intensity = Int64(intensity)
//        emotional.score = Int64(score)
//
//        emojiCategory.emotional = emotional
//
//        try saveContext()
//        return emotional
//    }
//
//
//    //MARK: CORE DATA METHODS
//    mutating func saveContext() throws{
//        if context.hasChanges{
//            do{
//                try context.save()
//                debugPrint(SucessType.sucessSaving)
//            } catch {
//                debugPrint(ErrorType.notSaved)
//            }
//        }
//    }
//
//    mutating func deleteObjectIndex(object: NSManagedObject) -> Bool{
//        context.delete(object)
//        do{
//            try saveContext()
//            debugPrint(SucessType.sucessDeleting)
//            return true
//        } catch{
//            debugPrint(ErrorType.notDeleted)
//            return false
//        }
//    }
}
