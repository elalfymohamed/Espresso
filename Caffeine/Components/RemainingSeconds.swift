//
//  RemainingSeconds.swift
//  Caffeine
//
//  Created by Alfy on 23/07/2026.
//

import SwiftUI

struct RemainingSeconds: View {
    @Binding var isCaffeineOn: Bool
    @Binding var selected: String
    @ObservedObject var caffeineTimer: CaffeineTimer

    var body: some View {
        Button {
            isCaffeineOn = false
            selected = "Activate for"
        } label: {
            if caffeineTimer.remainingSeconds > 0 {
                Text("\(DateUtils.formattedTime(caffeineTimer.remainingSeconds)) remaining")
            } else {
                Text("On indefinitely — tap to stop")
            }
        }
        .foregroundColor(.brown)
        .font(.headline)
    }
}

#Preview {
    @Previewable @State var isCaffeineOn: Bool = false
    @Previewable @State var selected: String = "Activate for"
    
    RemainingSeconds(isCaffeineOn: $isCaffeineOn,selected: $selected,  caffeineTimer: CaffeineTimer())
}
