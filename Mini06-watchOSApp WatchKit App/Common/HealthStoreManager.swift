//
//  HealthStoreManager.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation
import HealthKit

struct HealthStoreManager {
    enum Errors: LocalizedError {
        case CannotFetchData
        case NoHaveHealthStore
    }
    
    static let shared = HealthStoreManager()
    var healthStore: HKHealthStore?
    
    let sleepAnalysis = HKCategoryType(.sleepAnalysis)
    
    let stepCount = HKQuantityType(.stepCount)
    let kcalLost = HKQuantityType(.activeEnergyBurned)
    let distanceWalked = HKQuantityType(.distanceWalkingRunning)
    
    private init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            healthStore = nil
        }
    }
    
    private func requestAuthorization(forRead: Set<HKObjectType>, forShare: Set<HKSampleType>) async -> Bool {
        return await withCheckedContinuation { (continuation: CheckedContinuation<Bool, Never>) in
            guard let healthStore = healthStore else {
                continuation.resume(returning: false)
                return
            }

            healthStore.requestAuthorization(
                toShare: forShare, read: forRead,
                completion: { (success, error) in
                    if success {
                        continuation.resume(returning: true)
                    } else {
                        continuation.resume(returning: false)
                    }
                }
            )
        }
    }
    
    func getSleepTime() async throws -> Double {
        if await requestAuthorization(forRead: [sleepAnalysis], forShare: []) {
            let descriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]
            return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Double, Error>) in
                guard let healthStore = healthStore else {
                    continuation.resume(throwing: HealthStoreManager.Errors.NoHaveHealthStore)
                    return
                }

                let query = HKSampleQuery(
                    sampleType: HKCategoryType(.sleepAnalysis),
                    predicate: nil, limit: 2,
                    sortDescriptors: descriptors,
                    resultsHandler: { query, samples, error in
                        guard error == nil else {
                            debugPrint("[Error - Fetch Sleep Data]: \(error?.localizedDescription ?? "NO CAUSE")")
                            continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                            return
                        }
                        
                        guard let sample = samples?.first as? HKCategorySample else {
                            continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                            return
                        }
                        
                        let sleepTimeForOneDay = Double(sample.endDate.timeIntervalSince(sample.startDate))
                        continuation.resume(returning: sleepTimeForOneDay / 3_600.00)
                    }
                )
                
                healthStore.execute(query)
            }
        }
        throw HealthStoreManager.Errors.CannotFetchData
    }
    
    func getStepCount() async throws -> Int {
        if await requestAuthorization(forRead: [stepCount], forShare: []){
            let descriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]
            return try await withCheckedThrowingContinuation{(continuation: CheckedContinuation<Int,Error>) in
                guard let healthStore = healthStore else {
                    continuation.resume(throwing: HealthStoreManager.Errors.NoHaveHealthStore)
                    return
                }
                let query = HKSampleQuery(sampleType: HKQuantityType(.stepCount), predicate: nil, limit: 1, sortDescriptors: descriptors) { query, samples, error in
                    if let error = error {
                        debugPrint("[Error - Fetch Step Count Data]: \(error.localizedDescription)")
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                    }
                    
                    guard let sample = samples?.first as? HKCategorySample else {
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                        return
                    }
                    
                    let stepCountDay = Double(sample.endDate.timeIntervalSince(sample.startDate))
                    continuation.resume(returning: Int(stepCountDay))
                }
                healthStore.execute(query)
            }
        }
        throw HealthStoreManager.Errors.CannotFetchData
    }
    
    
    func getKcalLost() async throws -> Int {
        if await requestAuthorization(forRead: [kcalLost], forShare: []) {
            let descriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]
            
            return try await withCheckedThrowingContinuation{ (continuation: CheckedContinuation<Int,Error>) in
                guard let healthStore = healthStore else {
                    continuation.resume(throwing: HealthStoreManager.Errors.NoHaveHealthStore)
                    return
                }
                
                let query = HKSampleQuery(sampleType: HKQuantityType(.activeEnergyBurned), predicate: nil, limit: 2, sortDescriptors: descriptors) { query, samples, error in
                    if let error = error {
                        debugPrint("[Error - Fetch Kcal Lost Data]: \(error.localizedDescription)")
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                    }
                    
                    guard let sample = samples?.first as? HKCategorySample else {
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                        return
                    }
                    
                    let kcalLost = Int(sample.endDate.timeIntervalSince(sample.startDate))
                    
                    continuation.resume(returning: kcalLost)
                }
                
                healthStore.execute(query)
            }
            
        }
        throw HealthStoreManager.Errors.CannotFetchData
    }
    
    
    func getDistanceWalked() async throws -> Double {
        if await requestAuthorization(forRead: [distanceWalked], forShare: []) {
            let descriptors = [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]
            
            return try await withCheckedThrowingContinuation{ (continuation: CheckedContinuation<Double,Error>) in
                guard let healthStore = healthStore else {
                    continuation.resume(throwing: HealthStoreManager.Errors.NoHaveHealthStore)
                    return
                }
                
                let query = HKSampleQuery(sampleType: HKQuantityType(.distanceWalkingRunning), predicate: nil, limit: 2, sortDescriptors: descriptors) { query, samples, error in
                    if let error = error {
                        debugPrint("[Error - Fetch Kcal Lost Data]: \(error.localizedDescription)")
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                    }
                    
                    guard let sample = samples?.first as? HKCategorySample else {
                        continuation.resume(throwing: HealthStoreManager.Errors.CannotFetchData)
                        return
                    }
                    
                    let distanceWalked = Double(sample.endDate.timeIntervalSince(sample.startDate))
                    
                    continuation.resume(returning: distanceWalked)
                }
                healthStore.execute(query)
            }
        }
        throw HealthStoreManager.Errors.CannotFetchData
    }
}
