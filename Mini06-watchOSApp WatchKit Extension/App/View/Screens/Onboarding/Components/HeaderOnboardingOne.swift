//
//  HeaderOnboardingOne.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import SwiftUI

struct HeaderOnboardingOne: View {
    var metrics: GeometryProxy
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: .width(8, from: metrics))
                .fill(Color.clear)
                .frame(width: .width(137, from: metrics),
                       height: .width(34, from: metrics))
                .overlay {
                    ZStack {
                        HStack(spacing: 0) {
                            Image("genika_logo")
                                .resizable()
                                .frame(width: .width(97, from: metrics),
                                       height: .width(16, from: metrics))
                                .padding(.leading, .width(8, from: metrics))
                            
                            Spacer()
                        }
                    }
                }
            
            Spacer()
        }
    }
}

struct HeaderOnboardingOne_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            HeaderOnboardingOne(metrics: metrics)
        }
    }
}
