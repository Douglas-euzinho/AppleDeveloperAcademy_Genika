//
//  DiaryView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct DiaryView: View {
    @State private var showDataCollectingFlow: Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                RoundedRectangleButton(title: "Registrar",
                                imageName: "square.and.pencil",
                                theme: .light, metrics: metrics) {
                    showDataCollectingFlow = true
                }
                
                Spacer()
                RoundedRectangleButton(title: "Relatórios",
                                imageName: "doc.text",
                                theme: .dark, metrics: metrics)
                
                Spacer()
                RoundedRectangleButton(title: "Histórico",
                                imageName: "calendar",
                                theme: .dark, metrics: metrics)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Diário")
        .fullScreenCover(isPresented: $showDataCollectingFlow) {
            DataCollectingFlowView()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
