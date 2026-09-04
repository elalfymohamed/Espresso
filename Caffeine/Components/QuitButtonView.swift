//
//  QuitButtonView.swift
//  Caffeine
//
//  Created by Alfy on 04/09/2026.
//

import SwiftUI

struct QuitButtonView: View {
    @State private var isHoveringQuit = false
    
    var body: some View {
        VStack{
            Button {
                SleepManager.shared.allowSleep()
                NSApplication.shared.terminate(nil)
            } label: {
                Label("Quit Espresso", systemImage: "power")
                    .symbolEffect(.bounce, value: isHoveringQuit)
            }
            .keyboardShortcut("q")
            .buttonStyle(.plain)
            .foregroundStyle(isHoveringQuit ? .primary : .secondary)
            .font(.system(size: 12))
            .onHover { isHoveringQuit = $0 }
        }
        .padding(.top,8)
        .padding(.bottom,8)
    }
}

#Preview {
    QuitButtonView()
}


