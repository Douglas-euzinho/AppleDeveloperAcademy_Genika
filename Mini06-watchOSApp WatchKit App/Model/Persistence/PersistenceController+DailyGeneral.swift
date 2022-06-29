//
//  PersistenceController+DailyGeneral.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation
import CoreData

extension PersistenceController {

    //FUNC TO SAVE THE DAILY GENERAL
    @discardableResult
    mutating func createDailyGeneral(
        alimentation: Alimentation,
        emotional: Emotional,
        sleep: Sleep
    ) throws -> DailyGeneral {
        let dailyGeneral = DailyGeneral(context: context)
        dailyGeneral.date = Date.now
        
        dailyGeneral.alimentation = alimentation
        dailyGeneral.emotional = emotional
        dailyGeneral.sleep = sleep
        
        try saveContext()
        
        return dailyGeneral
    }
    
    //FUNC TO GET ALL DAILY GENERAL
    mutating func getAllDailyGeneral() -> [DailyGeneral] {
        let fetch: NSFetchRequest<DailyGeneral> = DailyGeneral.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
}
