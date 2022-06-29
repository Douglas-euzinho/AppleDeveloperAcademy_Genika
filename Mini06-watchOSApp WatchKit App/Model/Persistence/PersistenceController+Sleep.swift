//
//  PersistenceController+Sleep.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation
import CoreData

extension PersistenceController {
    mutating func createSleep(timeSleeping: Int) throws -> Sleep {
        let sleep = Sleep(context: context)
        
        sleep.score = Int64(timeSleeping)

        try saveContext()
        return sleep
    }
    
    func getSleep() -> [Sleep] {
        let fetch: NSFetchRequest<Sleep> = Sleep.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
}
