//
//  OnboardingFlowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 22/06/22.
//

import SwiftUI

struct OnboardingFlowView: View {
    enum Screens: CaseIterable {
        case one, two, three, main
    }
    
    @State private var screenSelected: Screens = .one
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Group {
                    switch screenSelected {
                    case .one:
                        OnboardingView(
                            onboardingText: .one,
                            hasSkipButton: true,
                            metrics: metrics,
                            headerView: {
                                HeaderOnboardingOne(metrics: metrics)
                            },
                            onNext: {
                                selectNextScreen(.two)
                            },
                            skipAction: {
                                presentMainScreen()
                            }
                        )
                        
                    case .two:
                        OnboardingView(
                            onboardingText: .two,
                            hasSkipButton: true,
                            metrics: metrics,
                            headerView: {
                                GeometryReader { dimension in
                                    HeaderOnboardingTwo(metrics: dimension)
                                }
                            },
                            onNext: {
                                selectNextScreen(.three)
                            },
                            skipAction: {
                                presentMainScreen()
                            }
                        )
                        
                    case .three:
                        OnboardingView(
                            onboardingText: .three,
                            hasSkipButton: false,
                            metrics: metrics,
                            headerView: {
                                HeaderOnboardingThree(metrics: metrics)
                            },
                            onNext: {
                                presentMainScreen()
                            }
                        )
                    case .main:
                        ContainerView()
                    }
                }
                .animation(.easeOut(duration: 0.4), value: screenSelected)
                .transition(.asymmetric(insertion: .move(edge: .trailing),
                                        removal: .move(edge: .leading)))
                
                if screenSelected != .main {
                    VStack {
                        Spacer()
                        PaginationIndicatior(allViewCases: [.one, .two, .three],
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
                                let nextScreen = Screens.allCases[nextIndex + 1]
                                if nextScreen == .main {
                                    presentMainScreen()
                                } else {
                                    selectNextScreen(nextScreen)                                    
                                }
                            }
                        default:
                            break
                        }
                    }),
                including: screenSelected == .main ? .subviews : .all)
        }
    }
    
    func presentMainScreen() {
        UserDefaults.standard.setValue(true, withKey: .onboardingPassed)
        selectNextScreen(.main)
    }
    
    private func selectNextScreen(_ nextScreen: Screens) {
        screenSelected = nextScreen
    }
}

struct OnboardingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFlowView()
    }
}
