//
//  DashedProgressView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 09/06/22.
//

import SwiftUI

struct DashedProgressView: View {
    var value: QuantityIndicator?
    var metrics: GeometryProxy
    var hasTriangleIndicator: Bool = true
    
    var body: some View {
        ZStack {
            CircularSegment(metrics: metrics, currentValue: value, indicator: .lowest, hasTriangleIndicator: hasTriangleIndicator)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .low, hasTriangleIndicator: hasTriangleIndicator)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .medium, hasTriangleIndicator: hasTriangleIndicator)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .high, hasTriangleIndicator: hasTriangleIndicator)
            CircularSegment(metrics: metrics, currentValue: value, indicator: .highest, hasTriangleIndicator: hasTriangleIndicator)
        }
    }
}
