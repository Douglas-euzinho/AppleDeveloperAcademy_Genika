//
//  HomePlaceholderView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 24/06/22.
//

import SwiftUI

struct HomePlaceholderView: View {
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Rectangle()
                    .fill(Color(uiColor: .darkGray))
                    .frame(width: 2)
                
                Rectangle()
                    .fill(Color(uiColor: .darkGray))
                    .frame(height: 2)
                
                VStack {
                    HStack {
                        HomePlaceholderSegmentView()
                            .frame(width: .width(82.5, from: metrics),
                                   height: .width(75, from: metrics))
                        
                        Spacer()
                        
                        HomePlaceholderSegmentView()
                            .frame(width: .width(82.5, from: metrics),
                                   height: .width(75, from: metrics))
                    }
                    
                    Spacer()
                    
                    HStack {
                        HomePlaceholderSegmentView()
                            .frame(width: .width(82.5, from: metrics),
                                   height: .width(75, from: metrics))
                        
                        Spacer()
                        
                        HomePlaceholderSegmentView()
                            .frame(width: .width(82.5, from: metrics),
                                   height: .width(75, from: metrics))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Health")
    }
}

struct HomePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlaceholderView()
    }
}
