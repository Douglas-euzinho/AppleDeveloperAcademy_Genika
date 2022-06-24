//
//  FoodQualityDataViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 22/06/22.
//

import Foundation

class FoodQualityDataViewModel: ObservableObject {
    
    @Published var foodArraySelected: [String] = []
    
    private func appendFoodSelected(food: String) {
        if foodArraySelected.contains(food) {
            return
        } else {
            foodArraySelected.append(food)
        }
    }
    
    func setupFoodArray(food: String, selected: Bool) {
        if selected {
            appendFoodSelected(food: food)
        } else {
            deleteFoodSelected(food: food)
        }
    }
    
    private func deleteFoodSelected(food: String) {
        for index in 0...foodArraySelected.count {
            if foodArraySelected[index] == food {
                foodArraySelected.remove(at: index)
                return
            }
        }
    }
}
