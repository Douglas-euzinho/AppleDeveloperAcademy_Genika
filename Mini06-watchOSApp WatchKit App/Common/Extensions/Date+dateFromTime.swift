//
//  Date+dateFromTime.swift
//  Mini06-watchOSApp WatchKit Extension
//
//  Created by Vitor Souza on 28/06/22.
//

import Foundation

extension Date {
    static func dateFromTime(hour: Int, minute: Int = 0) -> Date {
        guard (hour >= 0 && hour < 24) && (minute >= 0 && minute < 60) else {
            return .now
        }
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: .now)
        let day = dateComponents.day ?? 0
        let month = dateComponents.month ?? 0
        let year = dateComponents.year ?? 0
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateString = String(format: "%4i/%02i/%02i %02i:%02i", year, month, day, hour, minute)
        let dateTime = formatter.date(from: dateString)
        
        return dateTime ?? .now
    }
}
