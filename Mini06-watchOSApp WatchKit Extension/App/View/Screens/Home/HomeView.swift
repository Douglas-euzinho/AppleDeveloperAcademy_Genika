//
//  HomeView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 08/06/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        HomeGridView {
            HomeSegmentView(mainImagePath: "doc.fill",
                            lowLabel: "0r", highLabel: "9r",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.foodQualityValue)
            .frame(width: 82.5, height: 75)
        } row1Column2View: {
            HomeSegmentView(mainImagePath: "doc.fill",
                            lowLabel: "0d", highLabel: "7d",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.activityQualityValue)
            .frame(width: 82.5, height: 75)
        } row2Column1View: {
            HomeSegmentView(mainImagePath: "doc.fill",
                            lowLabel: "0h", highLabel: "11h",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.sleepQualityValue)
            .frame(width: 82.5, height: 75)
        } row2Column2View: {
            HomeSegmentView(mainImagePath: "doc.fill",
                            lowLabel: "fra", highLabel: "int",
                            lowImagePath: "book", highImagePath: "star",
                            qualityProgressValue: homeViewModel.emotionalQualityValue)
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
        HomeView()
    }
}
