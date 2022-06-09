//
//  HomeSegmentView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct HomeSegmentView: View {
    let mainImagePath: String
    let lowLabel: String
    let highLabel: String
    let lowImagePath: String
    let highImagePath: String
    var qualityProgressValue: CGFloat
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                LinearProgressView(percentage: qualityProgressValue,
                                    metrics: metrics)
                
                Circle()
                    .trim(from: 0.55, to: 0.95)
                    .stroke(style: StrokeStyle(lineWidth: metrics.size.height * 0.075, lineCap: .round))
                    .frame(width: metrics.size.height * 0.75)
                    .foregroundColor(Color(uiColor: .darkGray))
                
                Image(systemName: "doc.fill")
                    .resizable()
                    .frame(width: metrics.size.height * 0.275,
                           height: metrics.size.height * 0.275)
                
                VStack {
                    HStack {
                        createTextIndicator(to: lowLabel,
                                            metrics: metrics)
                        Spacer()
                        createTextIndicator(to: highLabel,
                                            metrics: metrics)
                    }
                    
                    Spacer()
                    
                    HStack {
                        createImageIndicator(to: lowImagePath, metrics: metrics)
                        Spacer()
                        createImageIndicator(to: highImagePath, metrics: metrics)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func createTextIndicator(to text: String, metrics: GeometryProxy) -> some View {
        Text(text)
            .minimumScaleFactor(0.01)
            .frame(width: metrics.size.width * 0.2,
                   height: metrics.size.width * 0.2)
            .foregroundColor(Color(uiColor: .lightGray))
    }
    
    @ViewBuilder
    private func createImageIndicator(to imagePath: String, metrics: GeometryProxy) -> some View {
        Image(systemName: imagePath)
            .resizable()
            .frame(width: metrics.size.width * 0.175,
                   height: metrics.size.width * 0.175)
            .foregroundColor(Color(uiColor: .lightGray))
    }
}
