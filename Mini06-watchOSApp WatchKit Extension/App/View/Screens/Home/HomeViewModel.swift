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
        
        sleepFocusDataModel = FocusDataModel(title: "Sono",
                                             qualityLabel: "",
                                             quantityLabel: "")
        
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
}
