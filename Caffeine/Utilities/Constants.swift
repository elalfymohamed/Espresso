//
//  Constants.swift
//  caffeine
//
//  Created by Alfy on 29/03/2026.
//

import Foundation

struct TimeConstants {
    static let options: [TimeOption] = [
        TimeOption(label: "Forever", value: -1),
        TimeOption(label: "5 minutes", value: 5),
        TimeOption(label: "10 minutes", value: 10),
        TimeOption(label: "15 minutes", value: 15),
        TimeOption(label: "30 minutes", value: 30),
        TimeOption(label: "1 hour", value: 60),
        TimeOption(label: "2 hours", value: 120),
        TimeOption(label: "5 hours", value: 300)
    ]
}
