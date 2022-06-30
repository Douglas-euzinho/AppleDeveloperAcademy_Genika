//
//  AppColors.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

enum AppColor: String {
    case darkGray = "dark_gray"
    case lightGray = "light_gray"
    case white
    case black
    case textColorGray
    
    var name: String { rawValue }
    var color: Color {
        if self == .textColorGray {
            return Color(uiColor: UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1.0))
        } else {
            return Color(rawValue)
        }
    }
}
