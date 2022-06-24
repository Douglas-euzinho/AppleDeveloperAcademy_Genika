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
    var quantityProgressValue: QuantityIndicator?
    var hasBackground: Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Circle()
                    .fill(hasBackground ? Color(uiColor: .darkGray) : Color.clear)
                    .frame(width: metrics.size.height * 0.6)
                    .overlay {
                        Image(mainImagePath)
                            .resizable()
                            .frame(width: metrics.size.height * 0.4,
                                   height: metrics.size.height * 0.4)
                    }
                
                LinearProgressView(percentage: qualityProgressValue,
                                   metrics: metrics)
                
                DashedProgressView(value: quantityProgressValue, metrics: metrics)
                
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

struct HomeSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSegmentView(mainImagePath: "doc.fill",
                        lowLabel: "0d", highLabel: "7d",
                        lowImagePath: "star", highImagePath: "book",
                        qualityProgressValue: 90,
                        quantityProgressValue: .medium)
    }
}
