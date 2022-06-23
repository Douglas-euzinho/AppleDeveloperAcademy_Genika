//
//  HeaderOnboardingTwo.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import SwiftUI

struct HeaderOnboardingTwo: View {
    var metrics: GeometryProxy
    
    var body: some View {
        HStack {
            VStack {
                Circle()
                    .fill(Color.clear)
                    .overlay {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: metrics.size.height * 0.5)
                    }
                    .background {
                        ZStack {
                            ZStack {
                                CircularSegment(metrics: metrics,
                                                currentValue: .lowest,
                                                indicator: .lowest,
                                                hasTriangleIndicator: false)
                                CircularSegment(metrics: metrics,
                                                currentValue: .low,
                                                indicator: .low,
                                                hasTriangleIndicator: false)
                                CircularSegment(metrics: metrics,
                                                currentValue: .medium,
                                                indicator: .medium,
                                                hasTriangleIndicator: false)
                                CircularSegment(metrics: metrics,
                                                currentValue: .high,
                                                indicator: .high,
                                                hasTriangleIndicator: false)
                                CircularSegment(metrics: metrics,
                                                currentValue: .highest,
                                                indicator: .highest,
                                                hasTriangleIndicator: false)
                            }
                        }
                    }
                
                Text("Quantidade")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            
            VStack {
                Circle()
                    .fill(Color.clear)
                    .overlay {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: metrics.size.height * 0.5)
                    }
                    .background {
                        LinearProgressView(percentage: 100, metrics: metrics)
                    }
                
                Text("Qualidade")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct HeaderOnboardingTwo_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            HeaderOnboardingTwo(metrics: metrics)
        }
    }
}
