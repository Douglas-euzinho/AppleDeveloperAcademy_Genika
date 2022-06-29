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
    
    @StateObject var homeViewModel = HomeViewModel()
    @State private var screenSelected: Screens? = .home
    
    var body: some View {
        Group {
            if homeViewModel.homeDataIsEmpty {
                EmptyHomeView(homeViewModel: homeViewModel)
            } else{
                TabView(selection: $screenSelected) {
                    HomeView(homeViewModel: homeViewModel)
                        .tag(Screens.home)
                    
                    DiaryView(homeViewModel: homeViewModel)
                        .tag(Screens.diary)
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
