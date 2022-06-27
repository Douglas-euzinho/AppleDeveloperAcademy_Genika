//
//  DataDailyGeneralCollector.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Douglas Figueirôa on 26/06/22.
//

import Foundation

struct DataDailyGeneralCollector {
    var alimentationArray: DataCollectorAlimentation
    var emotionalArray: DataCollectorEmotional
    var date: Date?
    
    mutating func setAlimentationArray(data: DataCollectorAlimentation){
//        alimentationArray.append(data.sendData())
        self.alimentationArray = data
    }
    
    mutating func setEmotionalArray(data: DataCollectorEmotional){
//        emotionalArray.append(data.sendData())
        self.emotionalArray = data
    }
    
    internal func sendData() -> DailyGeneral {
        var persistence = PersistenceController.shared
        
        do {
            let dailyGeneral = try persistence.dailyGeneral(alimentationArray: alimentationArray, emotionalArray: emotionalArray)
            return dailyGeneral
        } catch {
            return DailyGeneral()
        }
    }
}
