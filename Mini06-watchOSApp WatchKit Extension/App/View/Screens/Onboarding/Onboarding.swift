//
//  Onboarding.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 21/06/22.
//

import SwiftUI

struct Onboarding<T: View>: View {
    let onboardingText: OnboardingText
    let hasSkipButton: Bool
    var metrics: GeometryProxy
    var headerView: () -> T

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
                            // TODO: redirect to main screen
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
                    // TODO: redirect to next page
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            Onboarding(
                onboardingText: .one,
                hasSkipButton: true,
                metrics: metrics
            ) {
                HeaderOnboardingOne(metrics: metrics)
            }
        }
        
        GeometryReader { metrics in
            Onboarding(
                onboardingText: .two,
                hasSkipButton: true,
                metrics: metrics
            ) {
                GeometryReader { dimension in
                    HeaderOnboardingTwo(metrics: dimension)
                }
            }
        }
        
        GeometryReader { metrics in
            Onboarding(
                onboardingText: .three,
                hasSkipButton: false,
                metrics: metrics
            ) {
                HeaderOnboardingThree(metrics: metrics)
            }
        }
    }
}
