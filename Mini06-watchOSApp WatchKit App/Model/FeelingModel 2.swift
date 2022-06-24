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
        
        var name: String { rawValue }
    }
    
    let tag: Feelings
    let id: String
    let imageName: String
    let name: String
    
    init(tag: Feelings, imageName: String, name: String) {
        self.tag = tag
        self.id = tag.name
        self.imageName = imageName
        self.name = name
    }
    
    static let all = [
        FeelingModel(tag: .passionate, imageName: "feeling_passionate", name: "Apaixonado"),
        FeelingModel(tag: .happy, imageName: "feeling_happy", name: "Alegre"),
        FeelingModel(tag: .excited, imageName: "feeling_excited", name: "Empolgado"),
        FeelingModel(tag: .neutral, imageName: "feeling_neutral", name: "Neutro"),
        FeelingModel(tag: .anxious, imageName: "feeling_anxious", name: "Ansioso"),
        FeelingModel(tag: .sad, imageName: "feeling_sad", name: "Triste"),
        FeelingModel(tag: .stressed, imageName: "feeling_stressed", name: "Estressado"),
    ]
}
