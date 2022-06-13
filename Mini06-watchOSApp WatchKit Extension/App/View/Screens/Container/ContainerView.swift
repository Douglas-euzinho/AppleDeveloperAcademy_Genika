//
//  ContainerView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 06/06/22.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView {
            HomeView()
            DiaryView()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
