//
//  LinearProgressiveView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct LinearProgressView: View {
    private struct BaseValue {
        static let lowValue = 0.05
        static let highValue = 0.45
    }
    
    var percentage: CGFloat
    var metrics: GeometryProxy
    private let defaultScaleFactor = 0.004
    private var progressValue: CGFloat {
        get {
            var value = percentage
            if percentage > 100.0 {
                value = 100.0
            } else if percentage < 0.0 {
                value = 0.0
            }
            return value * defaultScaleFactor
        }
    }
    
    var body: some View {
        Circle()
            .trim(from: BaseValue.lowValue, to: BaseValue.highValue)
            .stroke(style: StrokeStyle(lineWidth: metrics.size.height * 0.075, lineCap: .round))
            .frame(width: metrics.size.height * 0.75)
            .foregroundColor(Color(uiColor: .darkGray))
            .overlay {
                Circle()
                    .trim(from: BaseValue.highValue - progressValue, to: BaseValue.highValue)
                    .stroke(style: StrokeStyle(lineWidth: metrics.size.height * 0.075, lineCap: .round))
                    .frame(width: metrics.size.height * 0.75)
                    .foregroundColor(Color.white)
            }
    }
}
