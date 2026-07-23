//
//  ContentView.swift
//  caffeine
//
//  Created by Alfy on 26/03/2026.
//

import SwiftUI

struct ContentView: View {
    @State var selected: String = "Activate for"
    @State var sleectedTime: Int = 0
    @Binding var isCaffeineOn: Bool
    
    @State private var caffeineTimer = CaffeineTimer()
    
    var body: some View {
        VStack {
            Text("Caffeine")
                .foregroundColor(isCaffeineOn ? .brown : .gray)
                .font(.headline)

            if isCaffeineOn {
                RemainingSeconds(isCaffeineOn: $isCaffeineOn, selected: $selected,caffeineTimer: caffeineTimer)
             }
            DropDownMenu(selected: $selected, sleectedTime: $sleectedTime, isCaffeineOn: $isCaffeineOn)
        }
        .onAppear {
                caffeineTimer.onExpire = { isCaffeineOn = false }
            }
        .onChange(of: isCaffeineOn) { _, newValue in
            if newValue {
                caffeineTimer.startTimer(durationMinutes: sleectedTime)
                SleepManager.shared.preventSleep()
            } else {
                caffeineTimer.stopTimer()
                SleepManager.shared.allowSleep()
                selected = "Activate for"
            }
        }
        .onChange(of: sleectedTime) { _, newDuration in
            guard isCaffeineOn else { return }
            caffeineTimer.startTimer(durationMinutes: newDuration)
        }
        
    }

    
}

#Preview {
    @Previewable @State var isCaffeineOn: Bool = false
    ContentView(sleectedTime: 15, isCaffeineOn: $isCaffeineOn)
}
