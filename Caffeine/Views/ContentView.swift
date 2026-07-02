//
//  ContentView.swift
//  caffeine
//
//  Created by Alfy on 26/03/2026.
//

import SwiftUI



struct ContentView: View {
    @State var selectedTime: String = ""
    @Binding var isCaffeineOn : Bool
    var body: some View {
        VStack(){
            Text("Caffeine")
                    .foregroundColor(isCaffeineOn ? .brown : .gray)
                    .font(.headline)
                
            if !selectedTime.isEmpty{
                Button(action:{
                    SleepManager.shared.allowSleep()
                    selectedTime = ""
                    isCaffeineOn = false
                }){
                    Text(selectedTime)
                        .foregroundColor(.black)
                     .font(.headline)
                }
            }
            
            DropDownMenu(selectedTime: $selectedTime, isCaffeineOn: $isCaffeineOn)
        }
        
    }
}

#Preview {
    @Previewable @State var isCaffeineOn: Bool = false
    ContentView(isCaffeineOn: $isCaffeineOn)
}
