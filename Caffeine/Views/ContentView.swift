//
//  ContentView.swift
//  caffeine
//
//  Created by Alfy on 26/03/2026.
//

import SwiftUI



struct ContentView: View {
    @State private var isPresented: Bool = false

    var body: some View {
        VStack(){
            HStack(spacing: 8) {
                   Image(systemName: "cup.and.saucer.fill")
                       .foregroundColor(isPresented ? .brown : .gray)
                       .font(.headline)
                   Text("Caffeine")
                    .foregroundColor(isPresented ? .brown : .gray)
                    .font(.headline)
                
               }
                .offset(x: -20, y: 10)
                   
            
            
            TimeMenuView()
        }
        
    }
}

#Preview {
    ContentView()
}
