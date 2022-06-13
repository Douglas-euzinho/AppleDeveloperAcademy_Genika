//
//  DiaryView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: .height(8, from: metrics)) {
                DiaryButtonView(title: "Registrar",
                                imageName: "square.and.pencil",
                                theme: .light, metrics: metrics)
                
                DiaryButtonView(title: "Relatórios",
                                imageName: "doc.text",
                                theme: .dark, metrics: metrics)
                
                DiaryButtonView(title: "Histórico",
                                imageName: "calendar",
                                theme: .dark, metrics: metrics)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Diário")
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
