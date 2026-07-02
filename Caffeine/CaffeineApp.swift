//
//  CaffeineApp.swift
//  Caffeine
//
//  Created by Alfy on 29/03/2026.
//

import SwiftUI

@main
struct CaffeineApp: App {
    @State var isCaffeineOn: Bool = false
    
    
    var body: some Scene {
        MenuBarExtra {
            ContentView(isCaffeineOn: $isCaffeineOn)
        } label: {
            Label("Caffeine", systemImage: isCaffeineOn ? "cup.and.heat.waves.fill" : "cup.and.saucer.fill")
                .contentTransition(.symbolEffect(.replace))
                .animation(.default, value: isCaffeineOn)
        }
        .menuBarExtraStyle(.automatic)
       
    }
}
