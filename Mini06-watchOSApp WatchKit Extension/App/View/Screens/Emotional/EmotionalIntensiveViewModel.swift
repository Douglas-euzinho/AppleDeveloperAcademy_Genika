//
//  EmotionalIntensiveViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

class EmotionalIntensiveViewModel: ObservableObject {
    let feelingSelected: FeelingModel.Feelings?
    @Published var intensiveValue: QuantityIndicator = .lowest
    
    init(feelingSelected: FeelingModel.Feelings?) {
        self.feelingSelected = feelingSelected
    }
    
    func decrease() {
        withAnimation(.linear(duration: 0.25)) {
            switch intensiveValue {
            case .lowest:
                break
            case .low:
                intensiveValue = .lowest
            case .medium:
                intensiveValue = .low
            case .high:
                intensiveValue = .medium
            case .highest:
                intensiveValue = .high
            }
        }
    }
    
    func increase() {
        withAnimation(.linear(duration: 0.25)) {
            switch intensiveValue {
            case .lowest:
                intensiveValue = .low
            case .low:
                intensiveValue = .medium
            case .medium:
                intensiveValue = .high
            case .high:
                intensiveValue = .highest
            case .highest:
                break
            }
        }
    }
}
