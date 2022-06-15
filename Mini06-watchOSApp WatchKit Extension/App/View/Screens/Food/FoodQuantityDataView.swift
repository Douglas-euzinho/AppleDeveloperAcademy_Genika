//
//  FoodQuantityDataView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct FoodQuantityDataView: View {
    @State var value1: Int = 0
    @State var value2: Int = 0
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("O que comeu hoje?")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                }
                .padding(.bottom, .width(10, from: metrics))
                
                ScrollView {
                    FoodQualityRowView(imageName: "☕️", title: "Café", sublabel: "9:00", metrics: metrics) { selected in

                    }

                    FoodQualityRowView(imageName: "🍽", title: "Almoço", sublabel: "13:00", metrics: metrics) { selected in

                    }

                    FoodQualityRowView(imageName: "🛎", title: "Janta", sublabel: "20:00", metrics: metrics) { selected in

                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    HStack(spacing: .width(4, from: metrics)) {
                        FoodQuantityStepper(image: "💧", sublabel: "Copos", metrics: metrics, value: $value1)
                        FoodQuantityStepper(image: "🍌", sublabel: "Lanches", metrics: metrics, value: $value2)
                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0) {
                            Text("Salvar")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(appColor: .black)
                                .padding(.trailing, .width(8, from: metrics))
                            
                            Image(systemName: "arrow.down.to.line")
                                .font(.title3.weight(.medium))
                                .foregroundColor(appColor: .black)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .frame(height: .width(47, from: metrics))
                    .backgroundColor(appColor: .white)
                    .cornerRadius(8)
                }
            }
        }
    }
}

struct FoodQuantityDataView_Previews: PreviewProvider {
    static var previews: some View {
        FoodQuantityDataView()
    }
}

struct FoodQuantityStepper: View {
    let image: String
    let sublabel: String
    var metrics: GeometryProxy
    @Binding var value: Int
    
    var body: some View {
        VStack(spacing: 1) {
            VStack(spacing: 0) {
                HStack(spacing: .width(4, from: metrics)) {
                    Text("\(value)x")
                    Text(image)
                }
                .font(.title2.weight(.light))
                .foregroundColor(appColor: .white)
                .frame(maxWidth: .infinity)
                .padding(.top, .width(8, from: metrics))
                
                Text(sublabel)
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
                    decrease()
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
                    increase()
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
    
    func increase() {
        value += 1
    }
    
    func decrease() {
        if value > 0 {
            value -= 1
        }
    }
}
