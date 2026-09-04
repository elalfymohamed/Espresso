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
    @Binding var isEspressoOn: Bool
    
    @State private var espressoTimer = EspressoTimer()
    
    var body: some View {
        VStack {
            Text("Espresso")
                .foregroundColor(isEspressoOn ? .brown : .secondary)
                .font(.headline)
                .animation(.easeInOut(duration: 0.2), value: isEspressoOn)

            if isEspressoOn {
                RemainingSecondsView(isEspressoOn: $isEspressoOn, selected: $selected,espressoTimer: espressoTimer)
             }
            DropDownMenuView(selected: $selected, sleectedTime: $sleectedTime, isEspressoOn: $isEspressoOn)
            Divider()
            QuitButtonView()
        }
        .onAppear {
            espressoTimer.onExpire = { isEspressoOn = false }
            }
        .onChange(of: isEspressoOn) { _, newValue in
            if newValue {
                espressoTimer.startTimer(durationMinutes: sleectedTime)
                SleepManager.shared.preventSleep()
            } else {
                espressoTimer.stopTimer()
                SleepManager.shared.allowSleep()
                selected = "Activate for"
            }
        }
        .onChange(of: sleectedTime) { _, newDuration in
            guard isEspressoOn else { return }
            espressoTimer.startTimer(durationMinutes: newDuration)
        }
       
    }

    
}

#Preview {
    @Previewable @State var isEspressoOn: Bool = false
    ContentView(sleectedTime: 15, isEspressoOn: $isEspressoOn)
}
