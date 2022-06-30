//
//  ContainerView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 06/06/22.
//

import SwiftUI

struct ContainerView: View {
    private enum Screens: CaseIterable {
        case home, diary
    }
    
    private enum MoveDirection {
        case left, right
    }
    
    @StateObject var homeViewModel = HomeViewModel()
    @State private var screenSelected: Screens = .home
    @State private var moveDirection: MoveDirection = .left
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Group {
                    if homeViewModel.homeDataIsEmpty {
                        EmptyHomeView(homeViewModel: homeViewModel)
                    } else {
                        switch screenSelected {
                        case .home:
                            HomeView(homeViewModel: homeViewModel)
                        case .diary:
                            DiaryView(homeViewModel: homeViewModel)
                        }
                    }
                }
                .animation(.easeOut(duration: 0.4), value: screenSelected)
                .transition(viewsTransition())
                
                if !homeViewModel.homeDataIsEmpty {
                    VStack {
                        Spacer()
                        PaginationIndicatior(allViewCases: Screens.allCases,
                                             viewSelected: screenSelected,
                                             metrics: metrics)
                    }
                    .padding(.bottom)
                    .ignoresSafeArea(.all, edges: .bottom)
                }
            }
            .highPriorityGesture(
                DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                    .onEnded({ dragValue in
                        switch(dragValue.translation.width, dragValue.translation.height) {
                        case (...0, -30...30):
                            guard
                                let lastScreen = Screens.allCases.last,
                                screenSelected != lastScreen
                            else { return }
                            
                            if let nextIndex = Screens.allCases.firstIndex(of: screenSelected) {
                                moveDirection = .left
                                screenSelected = Screens.allCases[nextIndex + 1]
                            }
                        case (0..., -50...50):
                            guard
                                let firstScreen = Screens.allCases.first,
                                screenSelected != firstScreen
                            else { return }
                            
                            if let previousIndex = Screens.allCases.firstIndex(of: screenSelected) {
                                moveDirection = .right
                                screenSelected = Screens.allCases[previousIndex - 1]
                            }
                        default:
                            break
                        }
                    }),
                including: homeViewModel.homeDataIsEmpty ? .subviews : .all
            )
        }
    }
    
    func viewsTransition() -> AnyTransition {
        return .asymmetric(insertion: .move(edge: moveDirection == .left ? .trailing : .leading),
                           removal: .move(edge: moveDirection == .left ? .leading : .trailing))
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
