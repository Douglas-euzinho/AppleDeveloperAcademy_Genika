//
//  CGFloat+ScreenMetrics.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

extension CGFloat {
    static func width(_ value: CGFloat, from metrics: GeometryProxy) -> CGFloat {
        return metrics.size.width * (value / 184.0)
    }
    
    static func height(_ value: CGFloat, from metrics: GeometryProxy) -> CGFloat {
        return metrics.size.height * (value / 224.0)
    }
}
