//
//  HomeViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var foodQualityValue: CGFloat = 0
    @Published var activityQualityValue: CGFloat = 0
    @Published var sleepQualityValue: CGFloat = 0
    @Published var emotionalQualityValue: CGFloat = 0
    
    @Published var foodQuantityValue: QuantityIndicator? = .none
    @Published var activityQuantityValue: QuantityIndicator? = .none
    @Published var sleepQuantityValue: QuantityIndicator? = .none
    @Published var emotionalQuantityValue: QuantityIndicator? = .none
    
    @Published var homeDataIsEmpty: Bool = true
    
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
