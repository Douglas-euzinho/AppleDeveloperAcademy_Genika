//
//  View+AppColor.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 13/06/22.
//

import SwiftUI

extension View {
    func backgroundColor(appColor: AppColor) -> some View {
        return self.background(appColor.color)
    }
    
    func foregroundColor(appColor: AppColor) -> some View {
        return self.foregroundColor(appColor.color)
    }
}
