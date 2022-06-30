//
//  FocusView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 23/06/22.
//

import SwiftUI

struct FocusDataModel {
    let title: String
    var qualityLabel: String = ""
    var quantityLabel: String = ""
}

struct FocusView: View {
    let model: FocusDataModel
    @Binding var showFocusView: Bool
    @Binding var showFocusBackground: Bool
    @State var homeSegmentView: HomeSegmentView
    @State private var opacity: CGFloat = 0.15
    @State private var showContent: Bool = true
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                Color.black.ignoresSafeArea()
                    .opacity(opacity)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            opacity = 0.45
                        }
                    })
                
                if showContent {
                    VStack {
                        Text(model.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom)
                        
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: 6.0)
                            .fill(AppColor.darkGray.color.opacity(0.4))
                            .frame(width: .width(85, from: metrics))
                            .overlay {
                                GeometryReader { vstackDimension in
                                    VStack(spacing: 0) {
                                        Text(model.quantityLabel)
                                            .font(.caption2)
                                            .minimumScaleFactor(0.8)
                                            .frame(maxWidth: .infinity)
                                        
                                        Spacer()
                                        
                                        homeSegmentView
                                            .onAppear {
                                                homeSegmentView.hasBackground = true
                                            }
                                            .frame(height: vstackDimension.size.height * 0.55)
                                            .layoutPriority(1)
                                        
                                        Spacer()
                                        
                                        Text(model.qualityLabel)
                                            .font(.caption2)
                                            .frame(maxWidth: .infinity)
                                            .minimumScaleFactor(0.8)
                                    }
                                    .padding(.all, .width(4, from: metrics))
                                }
                            }
                        
                        Spacer()
                        
                        Text("Média dos últimos 7 dias")
                            .font(.caption2)
                            .minimumScaleFactor(0.8)
                            .foregroundColor(appColor: .textColorGray)
                            .padding(.bottom, .width(16, from: metrics))
                            .padding(.top)
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                }
            }
            .onTapGesture {
                if showContent {
                    showContent = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        showFocusView = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            showFocusBackground = false
                        }
                    }
                    withAnimation(.easeInOut(duration: 0.3)) {
                        opacity = 0.15
                    }
                }
            }
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        let homeSegmentView = HomeSegmentView(
            mainImagePath: "main_food_image",
            lowLabel: "0r", highLabel: "9r",
            lowImagePath: "book", highImagePath: "star",
            qualityProgressValue: 50,
            quantityProgressValue: .high
        )
        
        let model = FocusDataModel(title: "Alimentação",
                                   qualityLabel: "1 Refeição",
                                   quantityLabel: "Ruim")
        FocusView(model: model,
                  showFocusView: .constant(true),
                  showFocusBackground: .constant(true),
                  homeSegmentView: homeSegmentView)
    }
}
