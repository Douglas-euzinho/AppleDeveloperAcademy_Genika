//
//  EmotionalIntensiveView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

struct EmotionalIntensiveView: View {
    @EnvironmentObject var emotionalIntensiveVM: EmotionalIntensiveViewModel
    @ObservedObject var viewModel: DataCollectingFlowViewModel
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Text("Em que intensidade?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, .width(8, from: metrics))
                    .foregroundColor(Color.white)
                    .padding(.bottom, .height(20, from: metrics))
                
                HStack(spacing: 1) {
                    Button {
                        emotionalIntensiveVM.decrease()
                    } label: {
                        Rectangle()
                            .fill(AppColor.lightGray.color)
                            .frame(width: .width(44, from: metrics))
                            .cornerRadius(8.0, corners: [.bottomLeft, .topLeft])
                            .overlay {
                                Image(systemName: "minus")
                                    .foregroundColor(AppColor.white.color)
                            }
                    }
                    .buttonStyle(.borderless)
                    
                    Rectangle()
                        .fill(AppColor.lightGray.color)
                        .overlay {
                            EmotionIntensiveValueView(value: emotionalIntensiveVM.intensiveValue)
                                .frame(height: .width(5, from: metrics))
                                .padding(.horizontal, .width(4, from: metrics))
                                .animation(.linear(duration: 0.25), value: emotionalIntensiveVM.intensiveValue)
                        }
                    
                    Button {
                        viewModel.emotionalIntensiveViewModel.increase()
                    } label: {
                        Rectangle()
                            .fill(AppColor.lightGray.color)
                            .frame(width: .width(44, from: metrics))
                            .cornerRadius(8.0, corners: [.bottomRight, .topRight])
                            .overlay {
                                Image(systemName: "plus")
                                    .foregroundColor(AppColor.white.color)
                            }
                    }
                    .buttonStyle(.borderless)
                }
                .frame(height: .width(44, from: metrics))
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    RoundedSquareButton(metrics: metrics) {
                        viewModel.saveIntensiveValue()
                    }
                }
            }
        }
    }
}

struct EmotionalIntensiveVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionalIntensiveView(viewModel: DataCollectingFlowViewModel(coreDataObserver: HomeViewModel()))
    }
}
