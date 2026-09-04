//
//  EspressoApp.swift
//  Caffeine
//
//  Created by Alfy on 29/03/2026.
//

import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationWillTerminate(_ notification: Notification) {
        SleepManager.shared.allowSleep()
    }
}

@main
struct EspressoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var isEspressoOn: Bool = false
    
    var body: some Scene {
        MenuBarExtra {
            ContentView(isEspressoOn: $isEspressoOn)
                .padding(.top)
        } label: {
            Label("Espresso", systemImage: isEspressoOn ? "cup.and.heat.waves.fill" : "cup.and.saucer.fill")
                .contentTransition(.symbolEffect(.replace))
                .animation(.default, value: isEspressoOn)
        }
        .menuBarExtraStyle(.window)
    }
}
