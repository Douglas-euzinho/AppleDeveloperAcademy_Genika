//
//  CircularSegment.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 09/06/22.
//

import SwiftUI

struct CircularSegment: View {
    var metrics: GeometryProxy
    var currentValue: QuantityIndicator?
    var indicator: QuantityIndicator
    
    var body: some View {
        let segmentUnselectedStyle = StrokeStyle(lineWidth: metrics.size.height * 0.075,
                                                 lineCap: .round)
        let segmentSelectedStyle = StrokeStyle(lineWidth: metrics.size.height * 0.095,
                                               lineCap: .round)
        let segmentSelected = segmentSelectedEqual(currentValue, to: indicator)
        
        Circle()
            .trim(from: startPosition(of: indicator), to: endPosition(of: indicator))
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
                .rotationEffect(angle(of: indicator))
            }
    }
    
    func segmentSelectedEqual(
        _ segmentSelected: QuantityIndicator?,
        to defaultValue: QuantityIndicator
    ) -> Bool {
        return segmentSelected == defaultValue
    }
    
    private func startPosition(of indicator: QuantityIndicator?) -> CGFloat {
        switch indicator {
        case .lowest: return CGFloat(0.55)
        case .low: return CGFloat(0.64)
        case .medium: return CGFloat(0.73)
        case .high: return CGFloat(0.82)
        case .highest: return CGFloat(0.91)
        case .none: return CGFloat(0.0)
        }
    }
    
    private func endPosition(of indicator: QuantityIndicator?) -> CGFloat {
        switch indicator {
        case .lowest: return CGFloat(0.59)
        case .low: return CGFloat(0.68)
        case .medium: return CGFloat(0.77)
        case .high: return CGFloat(0.86)
        case .highest: return CGFloat(0.95)
        case .none: return CGFloat(0.0)
        }
    }
    
    private func angle(of indicator: QuantityIndicator?) -> Angle {
        switch indicator {
        case .lowest: return Angle(degrees: -65)
        case .low: return Angle(degrees: -32.5)
        case .medium: return Angle(degrees: 0)
        case .high: return Angle(degrees: 32.5)
        case .highest: return Angle(degrees: 65)
        case .none: return Angle(degrees: 0)
        }
    }
    
}
