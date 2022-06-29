//
//  FoodQuantityRowModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation

struct FoodQuantityRowModel: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var quantifier: Int
    var hourMeal: Date
    var sublabel: String {
        hourMeal.formatted(date: .omitted, time: .shortened)
    }
    
    static let allRows: [FoodQuantityRowModel] = [
        FoodQuantityRowModel(imageName: "☕️", title: "Café", quantifier: 3, hourMeal: .dateFromTime(hour: 9)),
        FoodQuantityRowModel(imageName: "🍽", title: "Almoço", quantifier: 2, hourMeal: .dateFromTime(hour: 13)),
        FoodQuantityRowModel(imageName: "🛎", title: "Janta", quantifier: 1, hourMeal: .dateFromTime(hour: 20)),
    ]
}
