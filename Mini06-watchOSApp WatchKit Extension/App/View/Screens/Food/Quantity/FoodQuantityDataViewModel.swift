//
//  FoodQuantityDataViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 22/06/22.
//

import Foundation

class FoodQuantityDataViewModel {
    var mealCategories: [DataCollectorMealCategory] = []
    private(set) var waterStepper = FoodQuantityStepperViewModel(image: "💧", sublabel: "Copos")
    private(set) var breakStepper = FoodQuantityStepperViewModel(image: "🍌", sublabel: "Lanches")
    
    func setupMealArray(mealDataModel: FoodQuantityRowModel, selected: Bool) {
        let mealCategory = DataCollectorMealCategory(category: mealDataModel.title,
                                                     hourMeal: mealDataModel.hourMeal,
                                                     quantifier: mealDataModel.quantifier)
        if selected {
            appendMeal(meal: mealCategory)
        } else {
            deleteMeal(meal: mealCategory)
        }
    }
    
    private func appendMeal(meal: DataCollectorMealCategory) {
        if !mealCategories.contains(meal) {
            mealCategories.append(meal)
        }    
    }

    private func deleteMeal(meal: DataCollectorMealCategory) {
        if let index = mealCategories.firstIndex(of: meal) {
            mealCategories.remove(at: index)
        }
    }
}
