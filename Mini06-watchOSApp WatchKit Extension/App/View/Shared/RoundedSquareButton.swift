//
//  RoundedSquareButton.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

struct RoundedSquareButton: View {
    var imageName: String = "chevron.right"
    var metrics: GeometryProxy
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .font(.body.weight(.bold))
                .foregroundColor(.black)
        }
        .buttonStyle(.borderless)
        .frame(width: .width(45, from: metrics),
               height: .width(45, from: metrics))
        .background(Color.white)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: .darkGray), lineWidth: 1)
        }
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            RoundedSquareButton(metrics: metrics)            
        }
    }
}
