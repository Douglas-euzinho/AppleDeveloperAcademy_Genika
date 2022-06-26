//
//  EmptyHome.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 22/06/22.
//

import SwiftUI
import HealthKit

struct EmptyHomeView: View {
    
    @State var showPermissionScreen: Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                Text("Bem vindo!")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(appColor: .white)
                    .padding(.bottom, .width(4, from: metrics))
                
                Text("Sem registros,\ncomece fazendo\no seu primeiro diário.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                
                Spacer()
                RoundedRectangleButton(
                    title: "Registrar",
                    imageName: "square.and.pencil",
                    theme: .light,
                    metrics: metrics,
                    action: {
                        let statusHealthStore = HealthKitFunctions.shared.checkHealthStore()
                        if statusHealthStore == 2{
                            print("Tudo OK")
                        } else{
                            showPermissionScreen = true
                        }
                    }
                )
            }
        }
        .sheet(isPresented: $showPermissionScreen, content: {
            PermissionFlowView()
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Health")
    }
}

struct EmptyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHomeView()
    }
}
