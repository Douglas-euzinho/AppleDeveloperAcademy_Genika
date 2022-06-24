//
//  PermissionView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import SwiftUI

struct PermissionView: View{
    
    var body: some View{
        
        GeometryReader{ metrics in
            VStack(alignment: .center){
                HStack(alignment:.top){
                    RoundedRectangle(cornerRadius: .width(8, from: metrics))
                        .frame(width: .width(40, from: metrics),
                               height: .width(40, from: metrics))
                    Text("Saúde")
                    Spacer()
                    Button {
                     //  skipAction()
                    } label: {
                        Text("Pular")
                            .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                    }
                    .buttonStyle(.borderless)

                }
                
                Text("Para fornecer relatórios\nprecisos, precisamos\nter acesso aos dados\ndo App saúde")
                    .font(.body)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                    .multilineTextAlignment(.center)
                    .fixedSize()
                PermissionButtonView(metrics: metrics){
                    HealthKitFunctions.autorizeHealthKit()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView()
    }
}
