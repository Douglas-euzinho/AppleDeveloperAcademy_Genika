//
//  PaginationIndicator.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 22/06/22.
//

import SwiftUI

struct PaginationIndicatior: View {
    var allViewCases: [OnboardingFlowView.Screens]
    var viewSelected: OnboardingFlowView.Screens
    var metrics: GeometryProxy
    
    var body: some View {
        HStack(spacing: .width(6, from: metrics)) {
            Spacer()
            ForEach((0..<allViewCases.count).indices, id: \.hashValue) { index in
                Circle()
                    .fill(allViewCases[index] == viewSelected ? Color.white : Color.gray)
                    .frame(width: .width(6, from: metrics),
                           height: .width(6, from: metrics))
            }
            Spacer()
        }
    }
}
