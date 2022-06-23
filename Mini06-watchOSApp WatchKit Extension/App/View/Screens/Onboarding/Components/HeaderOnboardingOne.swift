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
                .frame(width: .width(137, from: metrics),
                       height: .width(34, from: metrics))
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
