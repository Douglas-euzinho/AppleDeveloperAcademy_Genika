//
//  FoodQuantityDataViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 22/06/22.
//

import Foundation

class FoodQuantityDataViewModel: ObservableObject{
    
    @Published var mealArray:[String] = []
    
    func setupMealArray(meal:String,selected:Bool){
        
        if selected{
            appendMeal(meal: meal)
        }else{
            deleteMeal(meal: meal)
        }
    }
    
    private func appendMeal(meal:String){
        
        if mealArray.contains(meal){
            return
        } else{
            mealArray.append(meal)
        }    
    }

    private func deleteMeal(meal:String){
        
        for index in 0...mealArray.count{
            if mealArray[index] == meal{
                mealArray.remove(at: index)
                return
            }
        }
    }
}
