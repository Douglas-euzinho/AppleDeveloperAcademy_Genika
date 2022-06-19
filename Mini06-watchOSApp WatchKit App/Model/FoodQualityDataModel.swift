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
    
    static let data: [FoodQualityDataModel] = [
        FoodQualityDataModel(image: "🍞", name: "Carboidratos"),
        FoodQualityDataModel(image: "🥩", name: "Carnes"),
        FoodQualityDataModel(image: "🥕", name: "Vegetais"),
        FoodQualityDataModel(image: "🍎", name: "Frutas"),
        FoodQualityDataModel(image: "🧀", name: "Laticínios"),
        FoodQualityDataModel(image: "🛢", name: "Gorduras"),
        FoodQualityDataModel(image: "🍩", name: "Doces"),
        FoodQualityDataModel(image: "🍔", name: "Fast-Food"),
        FoodQualityDataModel(image: "🍫", name: "Processados"),
    ]
}
