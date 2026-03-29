//
//  DateUtils.swift
//  caffeine
//
//  Created by Alfy on 29/03/2026.
//

import Foundation

struct DateUtils {
    static func getTime(minutes:Int) -> Date{
        if minutes == -1 {
            return Date.distantFuture
        }
       return  Calendar.current.date(
            byAdding: .minute,
            value: minutes,
            to: Date()
        )!
    }
    
    static func getTimeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
