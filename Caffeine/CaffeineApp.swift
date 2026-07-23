//
//  CaffeineApp.swift
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
struct CaffeineApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var isCaffeineOn: Bool = false
    
    var body: some Scene {
        MenuBarExtra {
            ContentView(isCaffeineOn: $isCaffeineOn)
                .padding(.top)
        } label: {
            Label("Caffeine", systemImage: isCaffeineOn ? "cup.and.heat.waves.fill" : "cup.and.saucer.fill")
                .contentTransition(.symbolEffect(.replace))
                .animation(.default, value: isCaffeineOn)
        }
        .menuBarExtraStyle(.window)
    }
}
