//
//  FoodQualityDataView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI

struct FoodQualityDataView: View {
    private struct DataModel: Identifiable {
        let id = UUID()
        let image: String
        let name: String
    }
    
    private let data: [DataModel] = [
        DataModel(image: "🍞", name: "Carboidratos"),
        DataModel(image: "🥩", name: "Carnes"),
        DataModel(image: "🥕", name: "Vegetais"),
        DataModel(image: "🍎", name: "Frutas"),
        DataModel(image: "🧀", name: "Laticínios"),
        DataModel(image: "🛢", name: "Gorduras"),
        DataModel(image: "🍩", name: "Doces"),
        DataModel(image: "🍔", name: "Fast-Food"),
        DataModel(image: "🍫", name: "Processados"),
    ]
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedScreen: DataCollectingFlowView.DataCollectingFlowScreens
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    HStack(spacing: 0) {
                        Text("O que comeu hoje?")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .frame(width: .width(18, from: metrics),
                                       height: .width(18, from: metrics))
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.bottom, .width(10, from: metrics))
                    
                    ScrollView {
                        ForEach(data) { dataModel in
                            FoodQualityRowView(
                                imageName: dataModel.image,
                                title: dataModel.name,
                                metrics: metrics
                            ) { selected in
                                // TODO: put selected data model into a array for passing data to following view
                            }
                        }
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 0.0, height: .width(50, from: metrics))
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        NextButton(metrics: metrics) {
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
        .navigationTitle("Qualidade")
    }
}

struct FoodQualityDataView_Previews: PreviewProvider {
    static var previews: some View {
        FoodQualityDataView(selectedScreen: .constant(.foodQuantity))
    }
}

struct NextButton: View {
    var metrics: GeometryProxy
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.right")
                .font(.body.weight(.bold))
                .foregroundColor(.black)
        }
        .buttonStyle(.borderless)
        .frame(width: .width(45, from: metrics),
               height: .width(45, from: metrics))
        .background(Color.white)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: .darkGray), lineWidth: 1)
        }
    }
}

struct FoodQualityRowView: View {
    var imageName: String
    var title: String
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
