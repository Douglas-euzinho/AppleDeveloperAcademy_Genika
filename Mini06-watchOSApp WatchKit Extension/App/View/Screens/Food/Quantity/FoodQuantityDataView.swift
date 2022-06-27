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
                    FoodQualityRowView(imageName: "☕️", title: "Café", quantifier: 3, sublabel: "9:00", metrics: metrics) { selected in
                        viewModel.setupMealArray(meal: "Café", quantifier: 3, selected: selected)
                        setUpMealCategory(category: "Café", quantifier: 3)
                    }

                    FoodQualityRowView(imageName: "🍽", title: "Almoço", quantifier: 2, sublabel: "13:00", metrics: metrics) { selected in
                        viewModel.setupMealArray(meal: "Almoço", quantifier: 2, selected: selected)
                        setUpMealCategory(category: "Almoço", quantifier: 2)
                    }

                    FoodQualityRowView(imageName: "🛎", title: "Janta", quantifier: 1, sublabel: "20:00", metrics: metrics) { selected in
                        viewModel.setupMealArray(meal: "Janta", quantifier: 1, selected: selected)
                        setUpMealCategory(category: "Janta", quantifier: 1)
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
    }
    
    func setUpMealCategory(category: String, quantifier: Int) {
        data.dataAlimentation.setMealCategoryArray(category: category, quantifier: quantifier)
    }
}

struct FoodQuantityDataView_Previews: PreviewProvider {
    static var previews: some View {
        FoodQuantityDataView(selectedScreen: .constant(.foodQuantity), viewModel: FoodQuantityDataViewModel())
    }
}
