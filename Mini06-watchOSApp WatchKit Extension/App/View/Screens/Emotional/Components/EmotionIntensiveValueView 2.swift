//
//  EmotionIntensiveValueView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

struct EmotionIntensiveValueView: View {
    var value: QuantityIndicator
    
    var body: some View {
        HStack(spacing: 1) {
            Rectangle()
                .fill(selectColor(of: value, from: QuantityIndicator.allCases))
                .cornerRadius(8, corners: [.topLeft, .bottomLeft])
            
            Rectangle()
                .fill(selectColor(of: value, from: [.low, .medium, .high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.medium, .high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.highest]))
                .cornerRadius(8, corners: [.topRight, .bottomRight])
        }
    }
    
    private func selectColor(of value: QuantityIndicator, from array: [QuantityIndicator]) -> Color {
        let isSelected = array.contains(value)
        return isSelected ? AppColor.white.color : AppColor.darkGray.color
    }
}

struct EmotionIntensiveValueView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            EmotionIntensiveValueView(value: .medium)
                .frame(height: .width(45, from: metrics))
        }
    }
}
