//
//  OnboardingView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import SwiftUI

struct OnboardingView<T: View>: View {
    let onboardingText: OnboardingText
    let hasSkipButton: Bool
    var metrics: GeometryProxy
    var headerView: () -> T
    var onNext: () -> Void
    var skipAction: () -> Void = {}

    var body: some View {
        VStack(spacing: 0) {
            headerView()
                .frame(height: .width(34, from: metrics))
            
            Spacer()
            
            Text(onboardingText.rawValue)
                .font(.body)
                .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
            
            Spacer()
            
            HStack {
                if hasSkipButton {
                    VStack {
                        Spacer()
                        
                        Button {
                           skipAction()
                        } label: {
                            Text("Pular")
                                .foregroundColor(Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0)))
                        }
                        .buttonStyle(.borderless)
                    }
                    .frame(height: .width(45, from: metrics))
                }
                
                Spacer()
                RoundedSquareButton(metrics: metrics) {
                    onNext()
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            OnboardingView(
                onboardingText: .one,
                hasSkipButton: true,
                metrics: metrics,
                headerView: {
                    HeaderOnboardingOne(metrics: metrics)
                },
                onNext: { }
            )
        }
        
        GeometryReader { metrics in
            OnboardingView(
                onboardingText: .two,
                hasSkipButton: true,
                metrics: metrics,
                headerView: {
                    GeometryReader { dimension in
                        HeaderOnboardingTwo(metrics: dimension)
                    }
                },
                onNext: { }
            )
        }
        
        GeometryReader { metrics in
            OnboardingView(
                onboardingText: .three,
                hasSkipButton: false,
                metrics: metrics,
                headerView: {
                    HeaderOnboardingThree(metrics: metrics)
                },
                onNext: { }
            )
        }
    }
}
