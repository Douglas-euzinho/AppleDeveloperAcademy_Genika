//
//  EmotionalRowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct EmotionalRowView: View {
    let feeling: FeelingModel
    var metrics: GeometryProxy
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            action?()
        } label: {
            HStack(spacing: .width(8, from: metrics)){
                Image(feeling.imageName)
                    .resizable()
                    .frame(width: .height(40, from: metrics), height: .height(40, from: metrics))
                
                Text(feeling.name)
                    .foregroundColor(appColor: .white)
            }
            .padding(.leading, .width(8, from: metrics))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .buttonStyle(.borderless)
        .frame(height: .height(48, from: metrics))
        .background {
            RoundedRectangle(cornerRadius: .height(8, from: metrics))
                .stroke()
                .foregroundColor(appColor: .lightGray)
        }
    }
}
