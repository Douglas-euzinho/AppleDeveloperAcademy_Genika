//
//  FoodQualityRowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 19/06/22.
//

import SwiftUI

struct FoodQualityRowView: View {
    var imageName: String
    var title: String
    var quantifier: Int?
    var sublabel: String? = nil
    var metrics: GeometryProxy
    var action: (Bool) -> Void
    @State var isSelected: Bool = false
    
    var body: some View {
        Button {
            isSelected.toggle()
            action(isSelected)
        } label: {
            HStack(spacing: 0) {
                ZStack {
                    Text(imageName)
                        .font(.title)
                        .minimumScaleFactor(0.001)
                    
                    if isSelected {
                        Rectangle()
                            .fill(Color.white)
                        
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .foregroundColor(.black)
                    }
                }
                .frame(width: .width(20, from: metrics),
                       height: .width(20, from: metrics))
                .padding(.trailing, .width(8, from: metrics))
                
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? .black : .white)
                
                Spacer()
                
                if let sublabel = sublabel, isSelected {
                    Text(sublabel)
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                }
            }
            .padding(.vertical, .width(7, from: metrics))
            .padding(.horizontal, .width(8, from: metrics))
        }
        .buttonStyle(.borderless)
        .background(isSelected ? Color.white : Color.clear)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: .darkGray), lineWidth: 1)
        }
    }
}

struct FoodQualityRowView_Previews: PreviewProvider {
    @State static var rowSelected: Bool = true
    
    static var previews: some View {
        GeometryReader { metrics in
            VStack {
                Text(rowSelected ? "Row Selected ✅" : "Row Unselected ☑️")
                    .padding(.bottom)
                
                FoodQualityRowView(imageName: "🍞", title: "Carboidrato", metrics: metrics) { selected in
                    rowSelected = selected
                }
            }
        }
    }
}
