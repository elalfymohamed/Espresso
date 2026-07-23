//
//  CustomTimePickerView.swift
//  caffeine
//
//  Created by Alfy on 29/03/2026.
//

import SwiftUI

struct CustomTimePickerView: View {
    @Binding var selected: String
    @Binding var sleectedTime: Int

    @State private var wakeUpTime = DateUtils.getTime(minutes: 5)

    var body: some View {
        Form {
            DatePicker(
                "Time",
                selection: $wakeUpTime,
                displayedComponents: .hourAndMinute

            ).onChange(of: wakeUpTime) { _, newValue in
                selected = DateUtils.getTimeString(from: newValue)
                sleectedTime = DateUtils.getTimeMinutes(from: newValue)
            }
        }
        .padding()
        .frame(width: 280)
    }
}

#Preview {
    @Previewable @State var selected = "Activate for"
    @Previewable @State var sleectedTime: Int = 0
    CustomTimePickerView(selected: $selected, sleectedTime: $sleectedTime)
}
