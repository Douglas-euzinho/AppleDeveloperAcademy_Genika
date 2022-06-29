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
                                            qualityLabel: "1 Refeição",
                                            quantityLabel: "Ruim")
        
        activityFocusDataModel = FocusDataModel(title: "Atividades",
                                                qualityLabel: "30min",
                                                quantityLabel: "Pesado")
        
        sleepFocusDataModel = FocusDataModel(title: "Sono",
                                             qualityLabel: "8 horas",
                                             quantityLabel: "Muito bom")
        
        emotionalFocusDataModel = FocusDataModel(title: "Emoções",
                                                 qualityLabel: "Intenso",
                                                 quantityLabel: "Negativo")
        
        update()
    }
    
    func update() {
        let allDailyGeneral = PersistenceController.shared.getAllDailyGeneral()
        homeDataIsEmpty = allDailyGeneral.isEmpty
        let recordsDate = allDailyGeneral.compactMap({ $0.date }).sorted(by: { $0.compare($1) == .orderedDescending })
        hasRecordForToday = recordsDate.contains(where: { Calendar.current.isDateInToday($0) })
    }
    
    func randomizeValues() {
        let quantityArray = QuantityIndicator.allCases

        withAnimation(.easeInOut(duration: 0.5)) {
            foodQualityValue = CGFloat(Double.random(in: 0...100))
            activityQualityValue = CGFloat(Double.random(in: 0...100))
            sleepQualityValue = CGFloat(Double.random(in: 0...100))
            emotionalQualityValue = CGFloat(Double.random(in: 0...100))
            
            foodQuantityValue = quantityArray.randomElement()!
            activityQuantityValue = quantityArray.randomElement()!
            sleepQuantityValue = quantityArray.randomElement()!
            emotionalQuantityValue = quantityArray.randomElement()!
        }
    }
}
