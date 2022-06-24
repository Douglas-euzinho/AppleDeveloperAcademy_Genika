//
//  HomeView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HomeGridView {
            HomeSegmentView(mainImagePath: "main_food_image",
                            lowLabel: "0r", highLabel: "9r",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.foodQualityValue, quantityProgressValue: homeViewModel.foodQuantityValue)
            .frame(width: 82.5, height: 75)
        } row1Column2View: {
            HomeSegmentView(mainImagePath: "main_activity_image",
                            lowLabel: "0d", highLabel: "7d",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.activityQualityValue, quantityProgressValue: homeViewModel.activityQuantityValue)
            .frame(width: 82.5, height: 75)
        } row2Column1View: {
            HomeSegmentView(mainImagePath: "main_sleep_image",
                            lowLabel: "0h", highLabel: "11h",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.sleepQualityValue, quantityProgressValue: homeViewModel.sleepQuantityValue)
            .frame(width: 82.5, height: 75)
        } row2Column2View: {
            HomeSegmentView(mainImagePath: "main_emotional_image",
                            lowLabel: "fra", highLabel: "int",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.emotionalQualityValue, quantityProgressValue: homeViewModel.emotionalQuantityValue)
            .frame(width: 82.5, height: 75)
        }
        .navigationTitle("Health")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            homeViewModel.randomizeValues()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeViewModel: HomeViewModel())
    }
}
