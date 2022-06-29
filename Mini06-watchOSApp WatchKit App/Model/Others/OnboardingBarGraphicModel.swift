//
//  OnboardingBarGraphicModel.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import Foundation
import CoreGraphics

struct OnboardingBarGraphicModel: Identifiable {
    let id = UUID()
    let color: AppColor
    let heightMultiplier: CGFloat
    
    static var all: [OnboardingBarGraphicModel] = [
        OnboardingBarGraphicModel(color: .darkGray, heightMultiplier: 0.5),
        OnboardingBarGraphicModel(color: .darkGray, heightMultiplier: 0.6),
        OnboardingBarGraphicModel(color: .white , heightMultiplier: 1.0),
        OnboardingBarGraphicModel(color: .darkGray, heightMultiplier: 0.38),
        OnboardingBarGraphicModel(color: .darkGray, heightMultiplier: 0.5),
        OnboardingBarGraphicModel(color: .white, heightMultiplier: 1.0),
        OnboardingBarGraphicModel(color: .darkGray, heightMultiplier: 0.3),
    ]
}
