//
//  HomeViewModel + Feeling.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 29/06/22.
//

import SwiftUI

extension HomeViewModel{
    internal func updateEmotionalData(emotionalArray: [Emotional]) {
        guard !emotionalArray.isEmpty else {
            emotionalQuantityValue = .none
            emotionalFocusDataModel.qualityLabel = ""
            return
        }
        
        var amount: Double = 0.0
        emotionalArray.forEach { emotional in
            amount += Double(emotional.intensity)
        }
        
        let average = amount / Double(emotionalArray.count)
        switch average {
        case let emotionalScore where emotionalScore <= 1:
            emotionalQuantityValue = .lowest
        case let emotionalScore where emotionalScore <= 2:
            emotionalQuantityValue = .low
        case let emotionalScore where emotionalScore <= 3:
            emotionalQuantityValue = .medium
        case let emotionalScore where emotionalScore <= 4:
            emotionalQuantityValue = .high
        default:
            emotionalQuantityValue = .highest
        }
        
        emotionalFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            emotionalFocusDataModel.quantityLabel.append(" ")
        } else {
            emotionalFocusDataModel.quantityLabel.append(" ")
        }
        
        var qualityAmount: Double = 0
        emotionalArray.forEach { emotional in
            qualityAmount += Double(emotional.score) + 15
        }
        
        let qualityAverage = qualityAmount / Double(emotionalArray.count)
        emotionalQualityValue = (100 * qualityAverage)/30
    }
}
