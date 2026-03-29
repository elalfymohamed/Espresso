//
//  CustomTimePickerView.swift
//  caffeine
//
//  Created by Alfy on 29/03/2026.
//

import SwiftUI

struct CustomTimePickerView: View {
    @Binding var selected: String

    @State private var wakeUpTime = DateUtils.getTime(minutes: 5)

    var body: some View {
        Form {
            DatePicker(
                "Time",
                selection: $wakeUpTime,
                displayedComponents: .hourAndMinute

            ).onChange(of: wakeUpTime) { _, newValue in
                let formatter = DateUtils.getTimeString(from: newValue)
                selected = "Stop at \(formatter)"
            }
        }
        .padding()
        .frame(width: 280)
    }
}

#Preview {
    @Previewable @State var selectedTime = "Activate for"
    CustomTimePickerView(selected: $selectedTime)
}
