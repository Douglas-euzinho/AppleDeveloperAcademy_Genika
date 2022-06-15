//
//  EmotionalIntensiveView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

class EmotionalIntensiveViewModel: ObservableObject {
    let feelingSelected: FeelingModel.Feelings?
    @Published var intensiveValue: QuantityIndicator = .lowest
    
    init(feelingSelected: FeelingModel.Feelings?) {
        self.feelingSelected = feelingSelected
    }
    
    func decrease() {
        withAnimation(.linear(duration: 0.25)) {
            switch intensiveValue {
            case .lowest:
                break
            case .low:
                intensiveValue = .lowest
            case .medium:
                intensiveValue = .low
            case .high:
                intensiveValue = .medium
            case .highest:
                intensiveValue = .high
            }
        }
    }
    
    func increase() {
        withAnimation(.linear(duration: 0.25)) {
            switch intensiveValue {
            case .lowest:
                intensiveValue = .low
            case .low:
                intensiveValue = .medium
            case .medium:
                intensiveValue = .high
            case .high:
                intensiveValue = .highest
            case .highest:
                break
            }
        }
    }
}

struct EmotionalIntensiveView: View {
    @StateObject var viewModel: EmotionalIntensiveViewModel
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                Text("Em que intensidade?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, .width(8, from: metrics))
                    .foregroundColor(Color.white)
                    .padding(.bottom, .height(20, from: metrics))
                
                HStack(spacing: 1) {
                    Button {
                        viewModel.decrease()
                    } label: {
                        Rectangle()
                            .fill(AppColor.lightGray.color)
                            .frame(width: .width(44, from: metrics))
                            .cornerRadius(8.0, corners: [.bottomLeft, .topLeft])
                            .overlay {
                                Image(systemName: "minus")
                                    .foregroundColor(AppColor.white.color)
                            }
                    }
                    .buttonStyle(.borderless)
                    
                    Rectangle()
                        .fill(AppColor.lightGray.color)
                        .overlay {
                            EmotionIntensiveValueView(value: viewModel.intensiveValue)
                                .frame(height: .width(5, from: metrics))
                                .padding(.horizontal, .width(4, from: metrics))
                        }
                    
                    Button {
                        viewModel.increase()
                    } label: {
                        Rectangle()
                            .fill(AppColor.lightGray.color)
                            .frame(width: .width(44, from: metrics))
                            .cornerRadius(8.0, corners: [.bottomRight, .topRight])
                            .overlay {
                                Image(systemName: "plus")
                                    .foregroundColor(AppColor.white.color)
                            }
                    }
                    .buttonStyle(.borderless)
                }
                .frame(height: .width(44, from: metrics))
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 8.0)
                            .fill(AppColor.white.color)
                            .overlay {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(appColor: .darkGray)
                            }
                    }
                    .buttonStyle(.borderless)
                    .frame(width: .width(45, from: metrics), height: .width(45, from: metrics))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Intensive")
        }
    }
}

struct EmotionalIntensiveVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmotionalIntensiveView(viewModel: EmotionalIntensiveViewModel(feelingSelected: .happy))
    }
}


struct EmotionIntensiveValueView: View {
    var value: QuantityIndicator
    
    var body: some View {
        HStack(spacing: 1) {
            Rectangle()
                .fill(selectColor(of: value, from: QuantityIndicator.allCases))
                .cornerRadius(8, corners: [.topLeft, .bottomLeft])
            
            Rectangle()
                .fill(selectColor(of: value, from: [.low, .medium, .high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.medium, .high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.high, .highest]))
            
            Rectangle()
                .fill(selectColor(of: value, from: [.highest]))
                .cornerRadius(8, corners: [.topRight, .bottomRight])
        }
    }
    
    private func selectColor(of value: QuantityIndicator, from array: [QuantityIndicator]) -> Color {
        let isSelected = array.contains(value)
        return isSelected ? AppColor.white.color : AppColor.darkGray.color
    }
}
