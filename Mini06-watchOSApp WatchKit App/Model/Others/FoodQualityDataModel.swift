//
//  FoodQualityDataModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import Foundation

struct FoodQualityDataModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let quantifier: Int
    
    static let data: [FoodQualityDataModel] = [
        FoodQualityDataModel(image: "🍞", name: "Carboidratos", quantifier: 5),
        FoodQualityDataModel(image: "🥩", name: "Carnes", quantifier: 3),
        FoodQualityDataModel(image: "🥕", name: "Vegetais", quantifier: 4),
        FoodQualityDataModel(image: "🍎", name: "Frutas", quantifier: 4),
        FoodQualityDataModel(image: "🧀", name: "Laticínios", quantifier: 3),
        FoodQualityDataModel(image: "🛢", name: "Gorduras", quantifier: 2),
        FoodQualityDataModel(image: "🍩", name: "Doces", quantifier: -2),
        FoodQualityDataModel(image: "🍔", name: "Fast-Food", quantifier: -2),
        FoodQualityDataModel(image: "🍫", name: "Processados", quantifier: -4),
    ]
}
