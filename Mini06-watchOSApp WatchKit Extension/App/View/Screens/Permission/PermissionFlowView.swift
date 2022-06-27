//
//  PermissionFlowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Lucas Alexandre Amorim Leoncio on 26/06/22.
//

import SwiftUI

//
//  DataCollectingFlowView.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 15/06/22.
//

import SwiftUI
import HealthKit

struct PermissionFlowView: View {
    enum PermissionFlowScreens: Hashable {
        case permission,warning,dataFlow
        
        func next() -> PermissionFlowScreens? {
            switch self {
            case .permission:
                return .warning
            case .warning:
                return .dataFlow
            case .dataFlow:
                return nil
            }
        }
    }
    
    @State var selectedScreen: PermissionFlowScreens = .permission
    @State var permissionPassed: Bool = UserDefaults.standard.bool(withKey: .permissionPassed)
    
    var body: some View {
        ZStack {
            Group {
                switch selectedScreen {
                case .permission:
                    if permissionPassed{
                        DataCollectingFlowView()
                    }else{
                        PermissionView(selectedScreen: $selectedScreen)
                    }
                case .warning:
                    WarningView(selectedScreen: $selectedScreen)
                case .dataFlow:
                    DataCollectingFlowView()
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}


