//
//  HomeView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    enum FocusScreens {
        case first, second, third, fourth
    }
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State var showFocusView: Bool = false
    @State var focusScreenSelected: FocusScreens = .first
    
    var body: some View {
        GeometryReader { metrics in
            let FirstView = HomeSegmentView(
                mainImagePath: "main_food_image",
                lowLabel: "0r", highLabel: "9r",
                lowImagePath: "book", highImagePath: "star",
                qualityProgressValue: homeViewModel.foodQualityValue,
                quantityProgressValue: homeViewModel.foodQuantityValue
            )
            
            let SecondView = HomeSegmentView(
                mainImagePath: "main_activity_image",
                lowLabel: "0d", highLabel: "7d",
                lowImagePath: "book", highImagePath: "star",
                qualityProgressValue: homeViewModel.activityQualityValue,
                quantityProgressValue: homeViewModel.activityQuantityValue
            )
            
            let ThirdView = HomeSegmentView(
                mainImagePath: "main_sleep_image",
                lowLabel: "0h", highLabel: "11h",
                lowImagePath: "book", highImagePath: "star",
                qualityProgressValue: homeViewModel.sleepQualityValue,
                quantityProgressValue: homeViewModel.sleepQuantityValue
            )
            
            let FourthView = HomeSegmentView(
                mainImagePath: "main_emotional_image",
                lowLabel: "fra", highLabel: "int",
                lowImagePath: "book", highImagePath: "star",
                qualityProgressValue: homeViewModel.emotionalQualityValue,
                quantityProgressValue: homeViewModel.emotionalQuantityValue
            )
            
            ZStack {
                
                HomeGridView(
                    showFocusView: $showFocusView,
                    focusScreenSelected: $focusScreenSelected,
                    FirstView: FirstView,
                    SecondView: SecondView,
                    ThirdView: ThirdView,
                    FourthView: FourthView,
                    metrics: metrics
                )
                    .onTapGesture {
                        homeViewModel.randomizeValues()
                    }
                
                if showFocusView {
                    Group {
                        switch focusScreenSelected {
                        case .first:
                            FocusView(model: homeViewModel.foodFocusDataModel,
                                      showFocusView: $showFocusView,
                                      homeSegmentView: FirstView)
                        case .second:
                            FocusView(model: homeViewModel.activityFocusDataModel,
                                      showFocusView: $showFocusView,
                                      homeSegmentView: SecondView)
                        case .third:
                            FocusView(model: homeViewModel.sleepFocusDataModel,
                                      showFocusView: $showFocusView,
                                      homeSegmentView: ThirdView)
                        case .fourth:
                            FocusView(model: homeViewModel.emotionalFocusDataModel,
                                      showFocusView: $showFocusView,
                                      homeSegmentView: FourthView)
                        }
                    }
                    .animation(.spring(), value: showFocusView)
                }
            }
        }
        .navigationTitle("Health")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}
