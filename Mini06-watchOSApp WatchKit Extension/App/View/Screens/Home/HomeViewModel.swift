//
//  HomeViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    typealias QauntityProgressValue = DashedProgressView.QuantityIndicator
    
    @Published var foodQualityValue: CGFloat = 0
    @Published var activityQualityValue: CGFloat = 0
    @Published var sleepQualityValue: CGFloat = 0
    @Published var emotionalQualityValue: CGFloat = 0
    
    @Published var foodQuantityValue: QauntityProgressValue = .none
    @Published var activityQuantityValue: QauntityProgressValue = .none
    @Published var sleepQuantityValue: QauntityProgressValue = .none
    @Published var emotionalQuantityValue: QauntityProgressValue = .none
    
    func randomizeValues() {
        let quantityArray = QauntityProgressValue.allCases.filter({ $0 != .none })

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
