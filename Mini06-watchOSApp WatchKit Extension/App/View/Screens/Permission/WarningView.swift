//
//  WarningView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 24/06/22.
//

import SwiftUI

struct WarningView: View{
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: PermissionFlowView.PermissionFlowScreens
    let name: String = "Genika"

    var body: some View{
        
        VStack{
            Text("Atenção!")
                .font(.title3)
            ScrollView{
                VStack{
                    Text("É feito apenas uma\nmédia dos dados\nobtidos, não tome\nnenhuma decisão\nmédica a partir desse\napp. O \(name) não se\nresponsabilisa por quaisquer problemas.\nPara informações mais\nprecisas, consulte um\nprofissional da saúde.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                    Button(){
                        if let nextScreen = selectedScreen.next() {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                selectedScreen = nextScreen
                            }
                        } else {
                            dismiss()
                        }
                    } label: {
                        Text("Ok")
                    }
                }
            }
        }
    }
}


//struct Warning_Previews: PreviewProvider {
//    static var previews: some View {
//        WarningView()
//    }
//}
