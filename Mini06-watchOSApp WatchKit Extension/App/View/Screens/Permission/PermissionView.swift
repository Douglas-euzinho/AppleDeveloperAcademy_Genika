//
//  PermissionView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import SwiftUI
import HealthKit

struct PermissionView: View{
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: PermissionFlowView.PermissionFlowScreens
    var body: some View{
        GeometryReader{ metrics in
            
            VStack{
                
                HStack(alignment:.top){
                    
                    RoundedRectangle(cornerRadius: .width(8, from: metrics))
                        .frame(width: .width(40, from: metrics),
                               height: .width(40, from: metrics))
                    
                    Text("Saúde")
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Pular")
                            .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                    }
                    .buttonStyle(.borderless)
                }
                ScrollView{
                    VStack{
                        Text("Para fornecer relatórios precisos, precisamos ter acesso aos dados do App saúde.")
                            .font(.body)
                            .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer(minLength: 10)
                        
                        PermissionButtonView(text: "Permitir", metrics: metrics){
                            HealthKitFunctions.shared.autorizeHealthKit()
                            if let nextScreen = selectedScreen.next() {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    selectedScreen = nextScreen
                                }
                            } else {
                                dismiss()
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)

    }
}


//struct MyPreviewProvider_Previews: PreviewProvider {
//    static var previews: some View {
//        PermissionView()
//    }
//}
