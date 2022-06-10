//
//  HomeGridView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct HomeGridView<Content: View>: View {
    var row1Column1View: () -> Content
    var row1Column2View: () -> Content
    var row2Column1View: () -> Content
    var row2Column2View: () -> Content
    
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
                    row1Column1View()
                    Spacer()
                    row1Column2View()
                }
                
                Spacer()
                
                HStack {
                    row2Column1View()
                    Spacer()
                    row2Column2View()
                }
            }
        }
    }
}
