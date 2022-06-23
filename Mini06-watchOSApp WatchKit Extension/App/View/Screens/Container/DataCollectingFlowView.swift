//
//  DataCollectingFlowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct DataCollectingFlowView: View {
    enum DataCollectingFlowScreens: Hashable {
        case emotional, emotionalIntensive, alert, food, foodQuantity
        
        func next() -> DataCollectingFlowScreens? {
            switch self {
            case .emotional:
                return .emotionalIntensive
            case .emotionalIntensive:
                return .alert
            case .alert:
                return .food
            case .food:
                return .foodQuantity
            case .foodQuantity:
                return nil
            }
        }
    }
    
    @State var selectedScreen: DataCollectingFlowScreens = .emotional
    
    var body: some View {
        ZStack {
            Group {
                switch selectedScreen {
                case .emotional:
                    EmotionalView(selectedScreen: $selectedScreen)
                case .emotionalIntensive:
                    EmotionalIntensiveView(viewModel: EmotionalIntensiveViewModel(feelingSelected: nil), selectedScreen: $selectedScreen)
                case .alert:
                    FoodAlertView(selectedScreen: $selectedScreen)
                case .food:
                    FoodQualityDataView(selectedScreen: $selectedScreen)
                case .foodQuantity:
                    FoodQuantityDataView(selectedScreen: $selectedScreen)
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}

struct DataCollectingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        DataCollectingFlowView()
    }
}
