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
            print("deu quanto?", amount)
        }
        
        let average = amount / Double(exerciceArray.count)
        switch average {
        case let exerciceScore where exerciceScore < 100:
            activityQuantityValue = .lowest
            print("LOWEST")
        case let exerciceScore where exerciceScore < 200:
            activityQuantityValue = .low
            print("LOW")
        case let exerciceScore where exerciceScore < 300:
            activityQuantityValue = .medium
            print("MEDIUM")
        case let exerciceScore where exerciceScore < 500:
            activityQuantityValue = .high
            print("HIGH")
        default:
            activityQuantityValue = .highest
            print("HIGHEST")
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
                fallthrough
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
                fallthrough
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
                fallthrough
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
    }
}

//Passos remomendados: 10.000
//calorias gastas: 300
//distancia andada: 6
