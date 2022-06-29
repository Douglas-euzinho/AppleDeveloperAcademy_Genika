//
//  DiaryView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct DiaryView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var showDataCollectingFlow: Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Color.black.opacity(0.3)
                
                VStack(spacing: 0) {
                    Spacer()
                    RoundedRectangleButton(title: "Registrar",
                                    imageName: "square.and.pencil",
                                    theme: .light, metrics: metrics) {
                        showDataCollectingFlow = true
                    }
                    Spacer()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Diário")
        .fullScreenCover(isPresented: $showDataCollectingFlow) {
            DataCollectingFlowView(viewModel: DataCollectingFlowViewModel(coreDataObserver: homeViewModel))
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(homeViewModel: HomeViewModel())
    }
}
