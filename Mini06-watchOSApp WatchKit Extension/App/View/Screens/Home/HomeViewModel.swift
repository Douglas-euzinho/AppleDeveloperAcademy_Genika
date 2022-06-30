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
        foodFocusDataModel = FocusDataModel(title: "Alimentação")
        
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
        updateAlimentationData(alimentationArray: allDailyGeneral.compactMap({ $0.alimentation }))
        updateSleepData(sleepArray: allDailyGeneral.compactMap({ $0.sleep }))
        updateEmotionalData(emotionalArray: allDailyGeneral.compactMap({ $0.emotional }))
        updateExerciceData(exerciceArray: allDailyGeneral.compactMap({ $0.exercice }))
    }
}
