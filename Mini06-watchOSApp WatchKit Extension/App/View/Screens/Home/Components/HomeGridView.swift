//
//  HomeGridView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 23/06/22.
//

import SwiftUI

struct HomeGridView: View {
    @Binding var showFocusView: Bool
    @Binding var focusScreenSelected: HomeView.FocusScreens
    @Binding var showFocusBackground: Bool
    var FirstView: HomeSegmentView
    var SecondView: HomeSegmentView
    var ThirdView: HomeSegmentView
    var FourthView: HomeSegmentView
    var metrics: GeometryProxy
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(uiColor: .darkGray))
                .frame(width: 2)
            
            Rectangle()
                .fill(Color(uiColor: .darkGray))
                .frame(height: 2)
            
            VStack {
                HStack {
                    FirstView
                        .frame(width: .width(82.5, from: metrics),
                               height: .width(75, from: metrics))
                        .onLongPressGesture {
                            showFocusView(.first)
                        }
                    
                    Spacer()
                    
                    SecondView
                        .frame(width: .width(82.5, from: metrics),
                               height: .width(75, from: metrics))
                        .onLongPressGesture {
                            showFocusView(.second)
                        }
                }
                
                Spacer()
                
                HStack {
                    ThirdView
                        .frame(width: .width(82.5, from: metrics),
                               height: .width(75, from: metrics))
                        .onLongPressGesture {
                            showFocusView(.third)
                        }
                    
                    Spacer()
                    
                    FourthView
                        .frame(width: .width(82.5, from: metrics),
                               height: .width(75, from: metrics))
                        .onLongPressGesture {
                            showFocusView(.fourth)
                        }
                }
            }
        }
    }
    
    private func showFocusView(_ screenSelected: HomeView.FocusScreens) {
        focusScreenSelected = screenSelected
        showFocusBackground = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            showFocusBackground = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            showFocusView = true
        }
    }
}
