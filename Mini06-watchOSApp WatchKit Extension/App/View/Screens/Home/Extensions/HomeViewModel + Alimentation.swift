//
//  HomeViewModel + Alimentation.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 29/06/22.
//

import SwiftUI

extension HomeViewModel{
    internal func updateAlimentationData(alimentationArray: [Alimentation]) {
        guard !alimentationArray.isEmpty else {
            foodQuantityValue = .none
            foodFocusDataModel.quantityLabel = ""
            return
        }
        
        var amount: Double = 0.0
        alimentationArray.forEach { alimentation in
            amount += Double(alimentation.breakCount)
            amount += Double(alimentation.meal?.count ?? 0)
        }
        
        let average = amount / Double(alimentationArray.count)
        switch average {
        case let foodQuantity where foodQuantity < 2:
            foodQuantityValue = .lowest
        case let foodQuantity where foodQuantity < 4:
            foodQuantityValue = .low
        case let foodQuantity where foodQuantity < 7:
            foodQuantityValue = .medium
        case let foodQuantity where foodQuantity < 8:
            foodQuantityValue = .high
        default:
            foodQuantityValue = .highest
        }
        
        foodFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            foodFocusDataModel.quantityLabel.append(" Refeição")
        } else {
            foodFocusDataModel.quantityLabel.append(" Refeições")
        }
        
        var qualityAmount: Double = 0
        alimentationArray.forEach { alimentation in
            let meals = (alimentation.meal?.count ?? 0) * 2
            let waterCount = Int(alimentation.waterCount)
            let point = Int(alimentation.point)
            let breakCount = Int(alimentation.breakCount)
            var quality: Double = 0
            
            switch waterCount{
            case let count where count < 5:
                break
            case let count where count < 10:
                quality += 1
            case let count where count < 15:
                quality += 2
            default:
                quality += 3
            }
            
            switch breakCount{
            case let count where count == 1:
                quality += 1
            case let count where count == 2:
                quality += 2
            case let count where count == 3:
                quality += 3
            default:
                quality += 2
            }
            
            qualityAmount += (quality + Double(meals) + Double(point)) + 8
        }
        let qualityAverage = qualityAmount / Double(alimentationArray.count)
        foodQualityValue = (100 * qualityAverage) / 41
    }
}

// 2 litros de agua
// 3 refeicoes
// 3 lanches
// carbo,proteinas,frutas,vegetais,gorduras
