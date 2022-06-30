//
//  FoodQuantityDataView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct FoodQuantityDataView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DataCollectingFlowViewModel
        
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
                    VStack {
                        ForEach(FoodQuantityRowModel.allRows) { rowData in
                            FoodQualityRowView(
                                imageName: rowData.imageName,
                                title: rowData.title,
                                quantifier: rowData.quantifier,
                                sublabel: rowData.sublabel,
                                metrics: metrics,
                                action: { selected in
                                    viewModel.foodQuantityDataViewModel.setupMealArray(mealDataModel: rowData,
                                                                                       selected: selected)
                                }
                            )
                        }
                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    HStack(spacing: .width(4, from: metrics)) {
                        FoodQuantityStepper(viewModel: viewModel.foodQuantityDataViewModel.waterStepper,
                                            metrics: metrics)
                        FoodQuantityStepper(viewModel: viewModel.foodQuantityDataViewModel.breakStepper,
                                            metrics: metrics)
                    }
                    .padding(.bottom, .width(16, from: metrics))
                    
                    Button {
                        Task {
                            await viewModel.saveFoodQuantity(dismissAction: dismiss)
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
        FoodQuantityDataView(viewModel: DataCollectingFlowViewModel(coreDataObserver: HomeViewModel()))
    }
}
