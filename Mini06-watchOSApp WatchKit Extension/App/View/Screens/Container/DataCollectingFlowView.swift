//
//  DataCollectingFlowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct DataCollectingFlowView: View {
    enum Screens: Hashable {
        case emotional
        case emotionalIntensive
        case alert
        case food
        case foodQuantity
    }
    
    @StateObject var viewModel: DataCollectingFlowViewModel
    
    var body: some View {
        ZStack {
            Group {
                switch viewModel.selectedScreen {
                case .emotional:
                    EmotionalView(viewModel: viewModel)
                case .emotionalIntensive:
                    EmotionalIntensiveView(viewModel: viewModel)
                        .environmentObject(viewModel.emotionalIntensiveViewModel)
                case .alert:
                    FoodAlertView(viewModel: viewModel)
                case .food:
                    FoodQualityDataView(viewModel: viewModel)
                case .foodQuantity:
                    FoodQuantityDataView(viewModel: viewModel)
                }
            }
            .animation(.easeInOut(duration: 0.6), value: viewModel.selectedScreen)
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}
