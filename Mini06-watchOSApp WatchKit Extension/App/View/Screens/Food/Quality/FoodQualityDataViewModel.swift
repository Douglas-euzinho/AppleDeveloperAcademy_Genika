//
//  FoodQualityDataViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 22/06/22.
//

import Foundation

class FoodQualityDataViewModel {
    var foodCategories: [DataCollectorAlimentationCategory] = []
    
    func setupFoodArray(dataModel: FoodQualityDataModel, selected: Bool) {
        let foodCategory = DataCollectorAlimentationCategory(alimentationCategory: dataModel.name,
                                                                     quantifier: dataModel.quantifier)
        if selected {
            appendFoodSelected(category: foodCategory)
        } else {
            deleteFoodSelected(category: foodCategory)
        }
    }
    
    private func appendFoodSelected(category: DataCollectorAlimentationCategory) {
        if !foodCategories.contains(category) {
            foodCategories.append(category)
        }
    }
    
    private func deleteFoodSelected(category: DataCollectorAlimentationCategory) {
        if let index = foodCategories.firstIndex(of: category) {
            foodCategories.remove(at: index)
        }
    }
}
