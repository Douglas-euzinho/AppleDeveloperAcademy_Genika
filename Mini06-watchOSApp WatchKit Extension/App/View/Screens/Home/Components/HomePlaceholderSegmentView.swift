//
//  HomePlaceholderSegmentView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 24/06/22.
//

import SwiftUI

struct HomePlaceholderSegmentView: View {
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                RoundedRectangle(cornerRadius: 2.0)
                    .fill(Color(uiColor: .darkGray))
                    .frame(width: metrics.size.height * 0.3,
                           height: metrics.size.height * 0.3)
                
                LinearProgressView(percentage: 0, metrics: metrics)
                
                DashedProgressView(value: .none, metrics: metrics)
                
                VStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(Color(uiColor: .darkGray))
                            .frame(width: metrics.size.width * 0.2,
                                   height: metrics.size.width * 0.15)
                        Spacer()
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(Color(uiColor: .darkGray))
                            .frame(width: metrics.size.width * 0.2,
                                   height: metrics.size.width * 0.15)
                    }
                    
                    Spacer()
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(Color(uiColor: .darkGray))
                            .frame(width: metrics.size.width * 0.15,
                                   height: metrics.size.width * 0.15)
                        Spacer()
                        RoundedRectangle(cornerRadius: 2.0)
                            .fill(Color(uiColor: .darkGray))
                            .frame(width: metrics.size.width * 0.15,
                                   height: metrics.size.width * 0.15)
                    }
                }
            }
        }
    }
}

struct HomePlaceholderSegmentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlaceholderSegmentView()
    }
}
