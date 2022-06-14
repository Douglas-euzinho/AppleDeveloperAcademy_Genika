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
