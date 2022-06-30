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
            emotionalFocusDataModel.qualityLabel = "Negativo"
            emotionalFocusDataModel.quantityLabel = "Muito Baixa"
        case let emotionalScore where emotionalScore <= 2:
            emotionalQuantityValue = .low
            emotionalFocusDataModel.qualityLabel = "Negativo"
            emotionalFocusDataModel.quantityLabel = "Baixa"
        case let emotionalScore where emotionalScore <= 3:
            emotionalQuantityValue = .medium
            emotionalFocusDataModel.qualityLabel = "Neutro"
            emotionalFocusDataModel.quantityLabel = "Média"
        case let emotionalScore where emotionalScore <= 4:
            emotionalQuantityValue = .high
            emotionalFocusDataModel.qualityLabel = "Positivo"
            emotionalFocusDataModel.quantityLabel = "Alta"
        default:
            emotionalQuantityValue = .highest
            emotionalFocusDataModel.qualityLabel = "Positivo"
            emotionalFocusDataModel.quantityLabel = "Muito Alta"
        }
        
        var qualityAmount: Double = 0
        emotionalArray.forEach { emotional in
            qualityAmount += Double(emotional.score) + 15
        }
        
        let qualityAverage = qualityAmount / Double(emotionalArray.count)
        emotionalQualityValue = (100 * qualityAverage)/30
    }
}
