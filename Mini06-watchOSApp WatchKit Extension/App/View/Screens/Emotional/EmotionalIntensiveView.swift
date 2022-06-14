//
//  EmotionalIntensiveView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct EmotionalIntensiveView: View {
    var feelingSelected: FeelingModel.Feelings?
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Text("Em que intensidade?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, .width(8, from: metrics))
                    .foregroundColor(Color.white)
                    .onAppear {
                        print("\(feelingSelected?.name ?? "no selection")")
                    }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Intensive")
        }
    }
}

struct EmotionalIntensiveVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionalIntensiveView(feelingSelected: .happy)
    }
}
