//
//  EmotionalView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct EmotionalView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: DataCollectingFlowView.DataCollectingFlowScreens
    let allFeelings = FeelingModel.all
    @State var feelingSelected: FeelingModel.Feelings?
    
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
                            feelingSelected = feeling.tag
                            if let nextScreen = selectedScreen.next() {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    selectedScreen = nextScreen
                                }
                            } else {
                                dismiss()
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.carousel)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Emocional")
        }
    }
}

struct EmotionalView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionalView(selectedScreen: .constant(.foodQuantity))
    }
}
