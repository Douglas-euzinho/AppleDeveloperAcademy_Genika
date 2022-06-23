//
//  Mini06_watchOSAppApp.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 06/06/22.
//

import SwiftUI

@main
struct Mini06_watchOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            var dailyGeneral = DailyGeneral()
            
            NavigationView {
                ContainerView()
                    .onAppear() {
//                        let viewContext = PersistenceController.shared.persistenceContainer.viewContext
                        PersistenceController.shared.dailyGeneral()
                        
                    }
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
