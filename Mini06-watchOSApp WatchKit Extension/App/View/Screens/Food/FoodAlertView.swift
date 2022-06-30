//
//  FoodAlertView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct FoodAlertView: View {
    @ObservedObject var viewModel: DataCollectingFlowViewModel
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                Spacer()
                
                Text("Muito bem!")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color.white)
                    .padding(.bottom, .height(9, from: metrics))
                
                Text("Agora vamos falar \nsobre alimentação.")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(uiColor: .lightGray))
                    .padding(.bottom, .height(40, from: metrics))
                
                Button {
                    viewModel.goToNextScreen()
                } label: {
                    Text("Continuar")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
}

struct FoodAlertView_Previews: PreviewProvider {
    static var previews: some View {
        FoodAlertView(viewModel: DataCollectingFlowViewModel(coreDataObserver: HomeViewModel()))
    }
}
