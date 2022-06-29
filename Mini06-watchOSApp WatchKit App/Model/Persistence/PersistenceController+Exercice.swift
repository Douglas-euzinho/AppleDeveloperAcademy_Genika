//
//  PersistenceController+Exercice.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 29/06/22.
//

import Foundation
import CoreData

extension PersistenceController {
    mutating func createExercice(stepCount: Int, kcalLost: Int, distanceWalked: Double) throws -> Exercice {
        let exercice = Exercice(context: context)
        
        exercice.countSteps = Int64(stepCount)
        exercice.kcalLost = Int64(kcalLost)
        exercice.distanceWalked = distanceWalked
        
        try saveContext()
        return exercice
    }
    
    func getExercice() -> [Exercice] {
        let fetch: NSFetchRequest<Exercice> = Exercice.fetchRequest()
        
        do {
            return try persistenceContainer.viewContext.fetch(fetch)
        } catch {
            return []
        }
    }
}
