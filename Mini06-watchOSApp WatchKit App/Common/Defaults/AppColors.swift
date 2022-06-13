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
    
    var name: String { rawValue }
    var color: Color { Color(rawValue) }
}
