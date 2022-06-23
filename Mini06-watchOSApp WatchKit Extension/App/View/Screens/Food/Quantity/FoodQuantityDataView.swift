//
//  FoodQuantityDataView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

class Quantity: ObservableObject{
    @Published var value = 0
}

struct FoodQuantityDataView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: DataCollectingFlowView.DataCollectingFlowScreens
    @ObservedObject var viewModel: FoodQuantityDataViewModel
    @EnvironmentObject var data: UserDataInput
    @State var waterQuatity: Quantity = Quantity()
    @State var breakQuatity: Quantity = Quantity()
    
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
                        viewModel.setupMealArray(meal: "Café", selected: selected)
                    }

                    FoodQualityRowView(imageName: "🍽", title: "Almoço", sublabel: "13:00", metrics: metrics) { selected in
                        viewModel.setupMealArray(meal: "Almoço", selected: selected)

                    }

                    FoodQualityRowView(imageName: "🛎", title: "Janta", sublabel: "20:00", metrics: metrics) { selected in
                        viewModel.setupMealArray(meal: "Janta", selected: selected)

                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    HStack(spacing: .width(4, from: metrics)) {
                        FoodQuantityStepper(viewModel: FoodQuantityStepperViewModel(image: "💧", sublabel: "Copos"),
                                            metrics: metrics).environmentObject(waterQuatity)
                        FoodQuantityStepper(viewModel: FoodQuantityStepperViewModel(image: "🍌", sublabel: "Lanches"),
                                            metrics: metrics).environmentObject(breakQuatity)
                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    Button {
                        if let nextScreen = selectedScreen.next() {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                selectedScreen = nextScreen
                            }
                        } else {
                            dismiss()
                            data.dataAlimentation.setMealCategoryArray(types: viewModel.mealArray)
                            data.dataAlimentation.waterCount = waterQuatity.value
                            data.dataAlimentation.breakCount = breakQuatity.value
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
        .navigationTitle("Quantidade")
    }
}

struct FoodQuantityDataView_Previews: PreviewProvider {
    static var previews: some View {
        FoodQuantityDataView(selectedScreen: .constant(.foodQuantity), viewModel: FoodQuantityDataViewModel())
    }
}
