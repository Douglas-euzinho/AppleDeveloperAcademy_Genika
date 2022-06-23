//
//  FoodQuantityStepperViewModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import Foundation

class FoodQuantityStepperViewModel: ObservableObject {
    let image: String
    let sublabel: String
    @Published private(set) var value: Int
    
    init(image: String, sublabel: String) {
        self.image = image
        self.sublabel = sublabel
        self.value = 0
    }
    
    func increase() -> Int{
        value += 1
        return value
    }
    
    func decrease() -> Int{
        if value > 0 {
            value -= 1
        }
        return value
    }
}
