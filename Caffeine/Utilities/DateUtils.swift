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
    
    static func getTimeMinutes(from date: Date) -> Int {
        let now = Date()
        var target = date
        if target < now {
            target = Calendar.current.date(byAdding: .day, value: 1, to: target) ?? target
        }
        let seconds = target.timeIntervalSince(now)
        return max(0, Int(seconds) / 60)
    }
    
    static func getTimeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    static func formattedTime(_ seconds: Int) -> String {
            String(format: "%02d:%02d", seconds / 60, seconds % 60)
    }
}
