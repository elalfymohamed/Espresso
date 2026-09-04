//
//  RemainingSecondsView.swift
//  Caffeine
//
//  Created by Alfy on 23/07/2026.
//

import SwiftUI

struct RemainingSecondsView: View {
    @Binding var isEspressoOn: Bool
    @Binding var selected: String
    @ObservedObject var espressoTimer: EspressoTimer

    var body: some View {
        Button {
            isEspressoOn = false
            selected = "Activate for"
        } label: {
            if espressoTimer.remainingSeconds > 0 {
                    Label("\(DateUtils.formattedTime(espressoTimer.remainingSeconds)) remaining",systemImage: "timer")
                    .symbolEffect(.pulse, options: .repeating)
            } else {
                Label("On indefinitely — tap to stop", systemImage: "infinity")
            }
        }
        .foregroundColor(.brown)
        .font(.headline)
    }
}

#Preview {
    @Previewable @State var isEspressoOn: Bool = false
    @Previewable @State var selected: String = "Activate for"
    
    RemainingSecondsView(isEspressoOn: $isEspressoOn,selected: $selected,  espressoTimer: EspressoTimer())
}
