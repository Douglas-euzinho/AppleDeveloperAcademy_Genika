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
        HKObjectType.categoryType(forIdentifier: .sleepChanges)!,
        HKObjectType.workoutType()
    ]
            
    func autorizeHealthKit(){
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes){ (_,_) in}
    }
}
