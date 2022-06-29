//
//  HomeViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

class HomeViewModel: ObservableObject, CoreDataObserverProtocol {
    @Published var foodQualityValue: CGFloat = 0
    @Published var activityQualityValue: CGFloat = 0
    @Published var sleepQualityValue: CGFloat = 0
    @Published var emotionalQualityValue: CGFloat = 0
    
    @Published var foodQuantityValue: QuantityIndicator? = .none
    @Published var activityQuantityValue: QuantityIndicator? = .none
    @Published var sleepQuantityValue: QuantityIndicator? = .none
    @Published var emotionalQuantityValue: QuantityIndicator? = .none
    
    @Published var homeDataIsEmpty: Bool = false
    @Published var hasRecordForToday: Bool = false
    
    @Published var foodFocusDataModel: FocusDataModel
    @Published var activityFocusDataModel: FocusDataModel
    @Published var sleepFocusDataModel: FocusDataModel
    @Published var emotionalFocusDataModel: FocusDataModel
    
    init() {
        foodFocusDataModel = FocusDataModel(title: "Alimentação",
                                            qualityLabel: "Ruim",
                                            quantityLabel: "1 Refeição")
        
        activityFocusDataModel = FocusDataModel(title: "Atividades",
                                                qualityLabel: "Pesado",
                                                quantityLabel: "30min")
        
        sleepFocusDataModel = FocusDataModel(title: "Sono")
        
        emotionalFocusDataModel = FocusDataModel(title: "Emoções",
                                                 qualityLabel: "Negativo",
                                                 quantityLabel: "Intenso")
        
        update()
    }
    
    func update() {
        let allDailyGeneral = PersistenceController.shared.getAllDailyGeneral()
        homeDataIsEmpty = allDailyGeneral.isEmpty
        
        let today = Date.now
        let lastWeekDate = Date.now.advanced(by: -604_800)
        
        let recordsDate = allDailyGeneral
            .compactMap({ $0.date })
            .sorted(by: { $0.compare($1) == .orderedDescending })
            .filter({ (lastWeekDate...today).contains($0) })
        
        hasRecordForToday = recordsDate.contains(where: { Calendar.current.isDateInToday($0) })
        
        updateSleepData(sleepArray: allDailyGeneral.compactMap({ $0.sleep }))
        updateEmotionalData(emotionalArray: allDailyGeneral.compactMap({ $0.emotional }))
        updateExerciceData(exerciceArray: allDailyGeneral.compactMap({ $0.exercice }))
    }
    
    private func updateSleepData(sleepArray: [Sleep]) {
        guard !sleepArray.isEmpty else {
            sleepQuantityValue = .none
            sleepFocusDataModel.quantityLabel = ""
            return
        }
        
        var amount: Double = 0.0
        sleepArray.forEach { sleep in
            amount += Double(sleep.score)
        }
        
        let average = amount / Double(sleepArray.count)
        switch average {
        case let sleepTime where sleepTime < 2:
            sleepQuantityValue = .lowest
        case let sleepTime where sleepTime < 6:
            sleepQuantityValue = .low
        case let sleepTime where sleepTime < 9:
            sleepQuantityValue = .medium
        case let sleepTime where sleepTime < 10:
            sleepQuantityValue = .high
        default:
            sleepQuantityValue = .highest
        }
        
        sleepFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            sleepFocusDataModel.quantityLabel.append(" hora")
        } else {
            sleepFocusDataModel.quantityLabel.append(" horas")
        }
    }
    
    private func updateEmotionalData(emotionalArray: [Emotional]) {
        guard !emotionalArray.isEmpty else {
            emotionalQuantityValue = .none
            emotionalFocusDataModel.qualityLabel = ""
            return
        }
        
        var amount: Double = 0.0
        emotionalArray.forEach { emotional in
            amount += Double(emotional.score)
            print("deu quanto?", amount)
        }
        
        let average = amount / Double(emotionalArray.count)
        switch average {
        case let emotionalScore where emotionalScore < 2:
            emotionalQuantityValue = .lowest
            print("LOWEST")
        case let emotionalScore where emotionalScore < 6:
            emotionalQuantityValue = .low
            print("LOW")
        case let emotionalScore where emotionalScore < 9:
            emotionalQuantityValue = .medium
            print("MEDIUM")
        case let emotionalScore where emotionalScore < 10:
            emotionalQuantityValue = .high
            print("HIGH")
        default:
            emotionalQuantityValue = .highest
            print("HIGHEST")
        }
        
        emotionalFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            emotionalFocusDataModel.quantityLabel.append(" ")
        } else {
            emotionalFocusDataModel.quantityLabel.append(" ")
        }
    }
    
    private func updateExerciceData(exerciceArray: [Exercice]) {
        guard !exerciceArray.isEmpty else {
            activityQuantityValue = .none
            activityFocusDataModel.qualityLabel = ""
            return
        }
        
        var amount: Double = 40
        exerciceArray.forEach { exercice in
            amount += Double(exercice.kcalLost)
            print("deu quanto?", amount)
        }
        
        let average = amount / Double(exerciceArray.count)
        switch average {
        case let exerciceScore where exerciceScore < 40:
            activityQuantityValue = .lowest
            print("LOWEST")
        case let exerciceScore where exerciceScore < 80:
            activityQuantityValue = .low
            print("LOW")
        case let exerciceScore where exerciceScore < 120:
            activityQuantityValue = .medium
            print("MEDIUM")
        case let exerciceScore where exerciceScore < 150:
            activityQuantityValue = .high
            print("HIGH")
        default:
            activityQuantityValue = .highest
            print("HIGHEST")
        }
        
        activityFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            activityFocusDataModel.quantityLabel.append(" ")
        } else {
            activityFocusDataModel.quantityLabel.append(" ")
        }
    }
}
