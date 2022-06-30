//
//  DataCollectingFlowViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import SwiftUI

class DataCollectingFlowViewModel: ObservableObject {
    @Published var data: UserDataInput = UserDataInput()
    @Published var selectedScreen: DataCollectingFlowView.Screens = .emotional
    @Published private var feelingSelected: FeelingModel.Feelings = .null
    @Published private(set) var emotionalIntensiveViewModel = EmotionalIntensiveViewModel()
    @Published private(set) var foodQualityDataViewModel = FoodQualityDataViewModel()
    @Published private(set) var foodQuantityDataViewModel = FoodQuantityDataViewModel()
    private var coreDataObserver: CoreDataObserverProtocol
    
    init(coreDataObserver: CoreDataObserverProtocol) {
        self.coreDataObserver = coreDataObserver
    }
    
    func goToNextScreen(dismissAction: DismissAction? = nil) {
        switch selectedScreen {
        case .emotional:
            selectedScreen = .emotionalIntensive
        case .emotionalIntensive:
            selectedScreen = .alert
        case .alert:
            selectedScreen = .food
        case .food:
            selectedScreen = .foodQuantity
        case .foodQuantity:
            dismissAction?()
        }
    }
    
    func selectFeeling(_ selectedFeeling: FeelingModel) {
        feelingSelected = selectedFeeling.tag
        data.dataEmotional.setFeeling(feeling: feelingSelected.rawValue, quantifier: selectedFeeling.quantifier)
        goToNextScreen()
    }
    
    func saveIntensiveValue() {
        data.dataEmotional.setIntesity(value: emotionalIntensiveViewModel.intensiveValue.rawValue)
        data.dataEmotional.calculateScore()
        goToNextScreen()
    }
    
    func saveFoodQuality() {
        data.dataAlimentation.setAlimentationCategoryArray(foodQualityDataViewModel.foodCategories)
        goToNextScreen()
    }
    
    func saveFoodQuantity(dismissAction: DismissAction) async {
        await MainActor.run(body: {
            data.dataAlimentation.setMealCategoryArray(foodQuantityDataViewModel.mealCategories)
            data.dataAlimentation.waterCount = foodQuantityDataViewModel.waterStepper.value
            data.dataAlimentation.breakCount = foodQuantityDataViewModel.breakStepper.value
        })
        await updateCoreData()
        await MainActor.run(body: {
            goToNextScreen(dismissAction: dismissAction)
        })
    }
    
    func updateCoreData() async {
        do {
            let timeSleeping = try? await HealthStoreManager.shared.getSleepTime()
            let sleep = try PersistenceController.shared.createSleep(timeSleeping: Int(timeSleeping ?? 0.0))
            
            let stepCount = try? await HealthStoreManager.shared.getStepCount()
            let kcalLost = try? await HealthStoreManager.shared.getKcalLost()
            let distanceWalked = try? await HealthStoreManager.shared.getDistanceWalked()
            let bpmAverage = try? await HealthStoreManager.shared.getBpmWalking()
            
            let exercice = try PersistenceController.shared.createExercice(stepCount: stepCount ?? 0, kcalLost: kcalLost ?? 0, distanceWalked: distanceWalked ?? 0.0,average: bpmAverage ?? 0)
            
            try data.saveData(sleep: sleep, exercice: exercice)
            
            DispatchQueue.main.async { [weak self] in
                self?.coreDataObserver.update()
            }
        } catch {
            print("[DataCollectingFlowViewModel] Error: \(error)")
        }
    }
}
