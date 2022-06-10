//
//  CircularSegment.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 09/06/22.
//

import SwiftUI

struct CircularSegment: View {
    var metrics: GeometryProxy
    var currentValue: DashedProgressView.QuantityIndicator
    var indicator: DashedProgressView.QuantityIndicator
    
    var body: some View {
        let segmentUnselectedStyle = StrokeStyle(lineWidth: metrics.size.height * 0.075,
                                                 lineCap: .round)
        let segmentSelectedStyle = StrokeStyle(lineWidth: metrics.size.height * 0.095,
                                               lineCap: .round)
        let segmentSelected = segmentSelectedEqual(currentValue, to: indicator)
        
        Circle()
            .trim(from: indicator.startPosition, to: indicator.endPosition)
            .stroke(style: segmentSelected ? segmentSelectedStyle : segmentUnselectedStyle)
            .frame(width: metrics.size.height * 0.75)
            .foregroundColor(Color(uiColor: segmentSelected ? .white : .darkGray))
            .overlay {
                VStack {
                    let triangleWidth: CGFloat = metrics.size.height * 0.1693
                    let triangleHeight: CGFloat = metrics.size.height * 0.1283
                    
                    if segmentSelected {
                        RoundedTriangle(cornerRadius: 1.5)
                            .fill(Color.white)
                            .frame(width: triangleWidth, height: triangleHeight)
                            .overlay {
                                RoundedTriangle(cornerRadius: 1.5)
                                    .stroke(lineWidth: metrics.size.height * 0.015)
                                    .frame(width: triangleWidth, height: triangleHeight)
                                    .foregroundColor(Color(uiColor: .black))
                            }
                    }
                    
                    Spacer()
                }
                .padding(.vertical, metrics.size.height * 0.1125)
                .rotationEffect(indicator.angle)
            }
    }
    
    func segmentSelectedEqual(
        _ segmentSelected: DashedProgressView.QuantityIndicator,
        to defaultValue: DashedProgressView.QuantityIndicator
    ) -> Bool {
        return segmentSelected == defaultValue
    }
    
}
