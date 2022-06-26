//
//  HealthKitFunctions.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import Foundation
import HealthKit

struct HealthKitFunctions{
    
    static var shared = HealthKitFunctions()
    private let healthStore = HKHealthStore()
    private let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        HKObjectType.categoryType(forIdentifier: .sleepChanges)!
    ]
            
    func autorizeHealthKit(){

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes){ (success, error) in
        
            if !success{
                print(error as Any)
            }
        }
    }
    
    func checkHealthStore() -> Int{
        var result = 0
        healthStore.getRequestStatusForAuthorization(toShare: healthKitTypes, read: healthKitTypes) { request, error in
            
            result = request.rawValue
        }
        
        return result
    }
}
