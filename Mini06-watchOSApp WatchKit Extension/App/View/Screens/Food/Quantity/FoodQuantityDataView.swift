//
//  FoodQuantityDataView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct FoodQuantityDataView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: DataCollectingFlowView.DataCollectingFlowScreens
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
                        FoodQuantityStepper(viewModel: FoodQuantityStepperViewModel(image: "💧", sublabel: "Copos"),
                                            metrics: metrics)
                        FoodQuantityStepper(viewModel: FoodQuantityStepperViewModel(image: "🍌", sublabel: "Lanches"),
                                            metrics: metrics)
                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    Button {
                        if let nextScreen = selectedScreen.next() {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                selectedScreen = nextScreen
                            }
                        } else {
                            dismiss()
                        }
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
        FoodQuantityDataView(selectedScreen: .constant(.foodQuantity))
    }
}
