//
//  DashedProgressView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 09/06/22.
//

import SwiftUI

struct DashedProgressView: View {
    
    enum QuantityIndicator: CaseIterable {
        case lowest, low, medium, high, highest, none
        
        var startPosition: CGFloat {
            switch self {
            case .lowest: return CGFloat(0.55)
            case .low: return CGFloat(0.64)
            case .medium: return CGFloat(0.73)
            case .high: return CGFloat(0.82)
            case .highest: return CGFloat(0.91)
            case .none: return CGFloat(0.0)
            }
        }
        
        var endPosition: CGFloat {
            switch self {
            case .lowest: return CGFloat(0.59)
            case .low: return CGFloat(0.68)
            case .medium: return CGFloat(0.77)
            case .high: return CGFloat(0.86)
            case .highest: return CGFloat(0.95)
            case .none: return CGFloat(0.0)
            }
        }
        
        var angle: Angle {
            switch self {
            case .lowest: return Angle(degrees: -65)
            case .low: return Angle(degrees: -32.5)
            case .medium: return Angle(degrees: 0)
            case .high: return Angle(degrees: 32.5)
            case .highest: return Angle(degrees: 65)
            case .none: return Angle(degrees: 0)
            }
        }
    }
    
    var value: QuantityIndicator
    var metrics: GeometryProxy
    
    var body: some View {
        ZStack {
            CircularSegment(metrics: metrics, currentValue: value, indicator: .lowest)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .low)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .medium)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .high)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .highest)
        }
    }
    
}
