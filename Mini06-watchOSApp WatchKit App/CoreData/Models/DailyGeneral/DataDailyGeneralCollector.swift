//
//  DataDailyGeneralCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 26/06/22.
//

import Foundation

struct DataDailyGeneralCollector {
    var alimentation: Alimentation
    var emotional: Emotional
    var date: Date?
    
    mutating func setAlimentation(data: Alimentation){
        self.alimentation = data
    }
    
    mutating func setEmotional(data: Emotional){
        self.emotional = data
    }
    
    internal func sendData() -> DailyGeneral {
        var persistence = PersistenceController.shared
        
        do {
            let dailyGeneral = try persistence.dailyGeneral(alimentation: alimentation, emotional: emotional)
            return dailyGeneral
        } catch {
            return DailyGeneral()
        }
    }
}
