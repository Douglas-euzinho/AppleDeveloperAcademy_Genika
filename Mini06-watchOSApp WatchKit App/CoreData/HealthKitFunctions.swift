//
//  HealthKitFunctions.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import Foundation
import HealthKit

struct HealthKitFunctions{
        
    static func autorizeHealthKit(){
        
        let healthStore = HKHealthStore()
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes){ (success, error) in
            
            if !success{
                print("Error")
            }
        }
    }
}
