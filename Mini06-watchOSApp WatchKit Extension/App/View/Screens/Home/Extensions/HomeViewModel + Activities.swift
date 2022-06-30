//
//  HomeViewModel + Activities.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 29/06/22.
//

import SwiftUI

extension HomeViewModel{
    internal func updateExerciceData(exerciceArray: [Exercice]) {
        guard !exerciceArray.isEmpty else {
            activityQuantityValue = .none
            activityQualityValue = 0
            activityFocusDataModel.qualityLabel = ""
            activityFocusDataModel.quantityLabel = ""
            return
        }
        
        //quantity
        var amount: Double = 0
        exerciceArray.forEach { exercice in
            amount += Double(exercice.kcalLost)
        }
        
        let average = amount / Double(exerciceArray.count)
        switch average {
        case let exerciceScore where exerciceScore < 100:
            activityQuantityValue = .lowest
        case let exerciceScore where exerciceScore < 200:
            activityQuantityValue = .low
        case let exerciceScore where exerciceScore < 300:
            activityQuantityValue = .medium
        case let exerciceScore where exerciceScore < 500:
            activityQuantityValue = .high
        default:
            activityQuantityValue = .highest
        }
        
        activityFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            activityFocusDataModel.quantityLabel.append(" ")
        } else {
            activityFocusDataModel.quantityLabel.append(" ")
        }
        
        //quality
        var qualityAmount: Double = 0
        exerciceArray.forEach { exercice in
            var quality: Double = 0
            
            switch exercice.countSteps{
            case let steps where steps < 2000:
                break
            case let steps where steps < 5000:
                quality += 1
            case let steps where steps < 7000:
                quality += 2
            case let steps where steps < 10000:
                quality += 3
            default:
                quality += 4
            }
            
            switch exercice.kcalLost{
            case let kcal where kcal < 100:
                break
            case let kcal where kcal < 200:
                quality += 1
            case let kcal where kcal < 300:
                quality += 2
            case let kcal where kcal < 500:
                quality += 3
            default:
                quality += 4
            }
            
            switch exercice.distanceWalked{
            case let distanceWalked where distanceWalked < 1:
                break
            case let distanceWalked where distanceWalked < 3:
                quality += 1
            case let distanceWalked where distanceWalked < 6:
                quality += 2
            case let distanceWalked where distanceWalked < 8:
                quality += 3
            default:
                quality += 4
            }
            qualityAmount += quality
        }
        
        let qualityAverage = qualityAmount / Double(exerciceArray.count)
        activityQualityValue = (100 * qualityAverage) / 12
        
        switch activityQualityValue{
        case let quality where quality <= 20:
            activityFocusDataModel.qualityLabel = "Muito Leve"
        case let quality where quality <= 40:
            activityFocusDataModel.qualityLabel = "Leve"
        case let quality where quality <= 60:
            activityFocusDataModel.qualityLabel = "Regular"
        case let quality where quality <= 80:
            activityFocusDataModel.qualityLabel = "Ótimo"
        default:
            activityFocusDataModel.qualityLabel = "Excelente"
        }
    }
}

//Passos remomendados: 10.000
//calorias gastas: 300
//distancia andada: 6
