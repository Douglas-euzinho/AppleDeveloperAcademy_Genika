//
//  PermissionButtonView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import SwiftUI

struct PermissionButtonView: View {
    
    let text: String
    var metrics: GeometryProxy
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: .width(8, from: metrics)) {
                Text(text)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .backgroundColor(appColor: .white)
        .buttonStyle(.borderless)
        .cornerRadius(.width(8, from: metrics))
    }
}
