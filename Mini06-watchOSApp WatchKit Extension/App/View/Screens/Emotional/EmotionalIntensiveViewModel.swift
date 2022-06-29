//
//  EmotionalIntensiveViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

class EmotionalIntensiveViewModel: ObservableObject {
    @Published var intensiveValue: QuantityIndicator = .lowest
    
    func decrease() {
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
    
    func increase() {
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
