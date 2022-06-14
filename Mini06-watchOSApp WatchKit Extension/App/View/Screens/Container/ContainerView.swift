//
//  ContainerView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 06/06/22.
//

import SwiftUI

struct ContainerView: View {
    private enum Screens: Hashable {
        case home, diary, emotional
    }
    
    @State private var screenSelected: Screens? = .home
    
    var body: some View {
        TabView(selection: $screenSelected) {
            EmotionalView()
                .tag(Screens.emotional)
            
            HomeView()
                .tag(Screens.home)
            
            DiaryView()
                .tag(Screens.diary)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
