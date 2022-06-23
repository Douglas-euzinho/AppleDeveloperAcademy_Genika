//
//  RoundedRectangleButton.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct RoundedRectangleButton: View {
    enum Theme {
        case light, dark
    }
    
    let title: String
    let imageName: String
    let theme: Theme
    var metrics: GeometryProxy
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: .width(8, from: metrics)) {
                Image(systemName: imageName)
                    .font(.body.weight(.semibold))
                    .foregroundColor(appColor: theme == .dark ? .white : .black)
                
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(appColor: theme == .dark ? .white : .black)
            }
            .frame(maxWidth: .infinity, maxHeight: .width(47, from: metrics))
        }
        .buttonStyle(.borderless)
        .backgroundColor(appColor: theme == .dark ? .darkGray : .white)
        .cornerRadius(.width(8, from: metrics))
    }
}

struct RoundedRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            RoundedRectangleButton(title: "Registrar", imageName: "doc.fill", theme: .light, metrics: metrics)
        }
    }
}
