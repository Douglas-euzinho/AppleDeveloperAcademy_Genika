//
//  EmotionalView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct EmotionalView: View {
    @ObservedObject var viewModel: DataCollectingFlowViewModel
    let allFeelings = FeelingModel.all

    var body: some View {
        GeometryReader { metrics in
            VStack {
                Text("Como está hoje?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, .width(8, from: metrics))
                    .foregroundColor(Color.white)
                
                List {
                    ForEach(allFeelings) { feeling in
                        EmotionalRowView(feeling: feeling, metrics: metrics) {
                            viewModel.selectFeeling(feeling)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.carousel)
            }
        }
    }
}

struct EmotionalView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionalView(viewModel: DataCollectingFlowViewModel(coreDataObserver: HomeViewModel()))
    }
}
