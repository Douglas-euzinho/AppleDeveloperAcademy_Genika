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
    
    func randomizeValues() {
        withAnimation(.easeInOut(duration: 0.5)) {
            foodQualityValue = CGFloat(Double.random(in: 0...100))
            activityQualityValue = CGFloat(Double.random(in: 0...100))
            sleepQualityValue = CGFloat(Double.random(in: 0...100))
            emotionalQualityValue = CGFloat(Double.random(in: 0...100))
        }
    }
}
