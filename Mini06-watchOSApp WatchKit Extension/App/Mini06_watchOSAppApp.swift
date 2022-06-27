//
//  Mini06_watchOSAppApp.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 06/06/22.
//

import SwiftUI

@main
struct Mini06_watchOSAppApp: App {
    
    let onboardingPassed: Bool
    
    init() {
        onboardingPassed = UserDefaults.standard.bool(withKey: .onboardingPassed)
    }
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if !onboardingPassed {
                        OnboardingFlowView()
                    } else {
                        ContainerView()                    
                    }
                }
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
