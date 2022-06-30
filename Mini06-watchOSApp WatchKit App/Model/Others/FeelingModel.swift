//
//  FeelingModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import Foundation

struct FeelingModel: Identifiable {
    enum Feelings: String {
        case passionate
        case happy
        case excited
        case neutral
        case anxious
        case sad
        case stressed
        case null
        
        var name: String { rawValue }
    }
    
    let tag: Feelings
    let id: String
    let imageName: String
    let name: String
    let quantifier: Int
    
    init(tag: Feelings, imageName: String, name: String, quantifier: Int) {
        self.tag = tag
        self.id = tag.name
        self.imageName = imageName
        self.name = name
        self.quantifier = quantifier
    }
    
    static let all = [
        FeelingModel(tag: .passionate, imageName: "feeling_passionate", name: "Apaixonado", quantifier: 3),
        FeelingModel(tag: .happy, imageName: "feeling_happy", name: "Alegre", quantifier: 1),
        FeelingModel(tag: .excited, imageName: "feeling_excited", name: "Empolgado", quantifier: 2),
        FeelingModel(tag: .neutral, imageName: "feeling_neutral", name: "Neutro", quantifier: 0),
        FeelingModel(tag: .anxious, imageName: "feeling_anxious", name: "Ansioso", quantifier: -2),
        FeelingModel(tag: .sad, imageName: "feeling_sad", name: "Triste", quantifier: -1),
        FeelingModel(tag: .stressed, imageName: "feeling_stressed", name: "Estressado", quantifier: -3),
    ]
}
