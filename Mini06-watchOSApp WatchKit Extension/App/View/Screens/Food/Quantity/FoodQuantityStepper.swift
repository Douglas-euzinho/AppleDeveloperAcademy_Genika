//
//  FoodQuantityStepper.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

struct FoodQuantityStepper: View {
    @ObservedObject var viewModel: FoodQuantityStepperViewModel
    var metrics: GeometryProxy
    
    var body: some View {
        VStack(spacing: 1) {
            VStack(spacing: 0) {
                HStack(spacing: .width(4, from: metrics)) {
                    Text("\(viewModel.value)x")
                    Text(viewModel.image)
                }
                .font(.title2.weight(.light))
                .foregroundColor(appColor: .white)
                .frame(maxWidth: .infinity)
                .padding(.top, .width(8, from: metrics))
                
                Text(viewModel.sublabel)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, .width(4, from: metrics))
            }
            .backgroundColor(appColor: .lightGray)
            .cornerRadius(8, corners: [.topLeft, .topRight])
            
            HStack(spacing: 1) {
                Button {
                    viewModel.decrease()
                } label: {
                    Rectangle()
                        .fill(AppColor.lightGray.color)
                        .frame(width: .width(44, from: metrics))
                        .cornerRadius(8.0, corners: [.bottomLeft])
                        .overlay {
                            Image(systemName: "minus")
                                .foregroundColor(AppColor.white.color)
                        }
                }
                .buttonStyle(.borderless)
                .frame(height: .width(44, from: metrics))
                
                Button {
                    viewModel.increase()
                } label: {
                    Rectangle()
                        .fill(AppColor.lightGray.color)
                        .frame(width: .width(44, from: metrics))
                        .cornerRadius(8, corners: [.bottomRight])
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(AppColor.white.color)
                        }
                }
                .buttonStyle(.borderless)
                .frame(height: .width(44, from: metrics))
            }
        }
    }
}

struct FoodQuantityStepper_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            FoodQuantityStepper(viewModel: FoodQuantityStepperViewModel(image: "💧", sublabel: "Copos"),
                                metrics: metrics)
        }
    }
}
