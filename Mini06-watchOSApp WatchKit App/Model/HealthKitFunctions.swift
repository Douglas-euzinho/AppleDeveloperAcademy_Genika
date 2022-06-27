//
//  HealthKitFunctions.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import Foundation
import HealthKit

struct HealthKitFunctions {
    
    static var shared = HealthKitFunctions()
    
    private let healthStore = HKHealthStore()
    private let healthKitTypesToRead: Set = [
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
        HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
        HKObjectType.quantityType(forIdentifier: .walkingStepLength)!,
        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        HKObjectType.categoryType(forIdentifier: .sleepChanges)!,
        HKObjectType.workoutType()
    ]
    private let healthKitTypesToShare: Set = [
        HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
        HKObjectType.quantityType(forIdentifier: .heartRate)!,
        HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
        HKObjectType.quantityType(forIdentifier: .walkingStepLength)!,
        HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        HKObjectType.categoryType(forIdentifier: .sleepChanges)!,
        HKObjectType.workoutType(),
    ]
            
    func autorizeHealthKit() {
        healthStore.requestAuthorization(toShare: nil, read: healthKitTypesToRead){ (_,_) in}
    }
    
    func checkAutorizationStatus() {
        healthStore.getRequestStatusForAuthorization(toShare: healthKitTypesToShare, read: healthKitTypesToRead) { status, error in
            print("Status: ", status.rawValue)
            print("Error: ", error ?? "no error")
        }
    }
}
