//
//  HomeViewModel + Sleep.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 29/06/22.
//

import SwiftUI

extension HomeViewModel{
    internal func updateSleepData(sleepArray: [Sleep]) {
        guard !sleepArray.isEmpty else {
            sleepQuantityValue = .none
            sleepFocusDataModel.quantityLabel = ""
            return
        }
        
        var amount: Double = 0.0
        sleepArray.forEach { sleep in
            amount += Double(sleep.score)
        }
        
        let average = amount / Double(sleepArray.count)
        switch average {
        case let sleepTime where sleepTime < 2:
            sleepQuantityValue = .lowest
            sleepQualityValue = 0
        case let sleepTime where sleepTime < 6:
            sleepQuantityValue = .low
            sleepQualityValue = 50
        case let sleepTime where sleepTime <= 9:
            sleepQuantityValue = .medium
            sleepQualityValue = 100
        case let sleepTime where sleepTime < 11:
            sleepQuantityValue = .high
            sleepQualityValue = 70
        default:
            sleepQuantityValue = .highest
            sleepQualityValue = 50
        }
        
        sleepFocusDataModel.quantityLabel = String(format: "%.1f", average)
        if average == 1.0 {
            sleepFocusDataModel.quantityLabel.append(" hora")
        } else {
            sleepFocusDataModel.quantityLabel.append(" horas")
        }
    }
}
