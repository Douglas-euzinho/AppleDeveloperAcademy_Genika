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
    @StateObject var data: UserDataInput = UserDataInput()
    @StateObject var emoji: EmojiCategory = EmojiCategory()
    
    var body: some View {
        ZStack {
            Group {
                switch selectedScreen {
                case .emotional:
                    EmotionalView(selectedScreen: $selectedScreen, emoji: emoji)
                case .emotionalIntensive:
                    EmotionalIntensiveView(viewModel: EmotionalIntensiveViewModel(), selectedScreen: $selectedScreen)
                case .alert:
                    FoodAlertView(selectedScreen: $selectedScreen)
                case .food:
                    FoodQualityDataView(selectedScreen: $selectedScreen, viewModel: FoodQuantityDataViewModel())
                case .foodQuantity:
                    FoodQuantityDataView(selectedScreen: $selectedScreen, viewModel: FoodQuantityDataViewModel())
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(data)
    }
    
}

