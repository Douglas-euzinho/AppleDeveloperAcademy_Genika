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

    // MARK: - CORE DATA METHODS
    
    mutating func saveContext() throws {
        if context.hasChanges{
            do{
                try context.save()
                debugPrint(SucessType.sucessSaving)
            } catch {
                debugPrint(ErrorType.notSaved)
            }
        }
    }

    mutating func deleteObjectIndex(object: NSManagedObject) -> Bool {
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
