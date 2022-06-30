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
        HKCategoryType(.sleepAnalysis),
        HKQuantityType(.stepCount),
        HKQuantityType(.activeEnergyBurned),
        HKQuantityType(.distanceWalkingRunning),
    ]

    func autorizeHealthKit() {
        healthStore.requestAuthorization(toShare: nil, read: healthKitTypesToRead){ (_,_) in}
    }
}
