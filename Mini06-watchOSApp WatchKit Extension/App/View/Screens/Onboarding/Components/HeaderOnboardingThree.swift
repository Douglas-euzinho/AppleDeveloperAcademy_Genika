//
//  HeaderOnboardingThree.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import SwiftUI

struct HeaderOnboardingThree: View {
    var metrics: GeometryProxy
    
    var body: some View {
        GeometryReader { dimension in
            HStack(spacing: .width(11, from: metrics)) {
                ForEach(OnboardingBarGraphicModel.all) { model in
                    VStack(spacing: 0) {
                        Spacer(minLength: 0)
                        
                        Rectangle()
                            .cornerRadius(4 , corners: [.topLeft, .topRight])
                            .foregroundColor(model.color.color)
                            .frame(height: dimension.size.height * model.heightMultiplier)
                    }
                }
            }
        }
    }
}

struct HeaderOnboardingThree_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            HeaderOnboardingThree(metrics: metrics)
        }
    }
}
