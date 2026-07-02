//
//  DropDownMenu.swift
//  Caffeine
//
//  Created by Alfy on 29/03/2026.
//
import SwiftUI

struct DropDownMenu: View {
    @State var selected:String = "Activate for"
    @State private var showingTime = false
    @Binding var selectedTime: String;
    @Binding var isCaffeineOn : Bool
    
    func addTime(_ minutes: Int){
        let newTime: Date = DateUtils.getTime(minutes: minutes)
        let formatter = DateUtils.getTimeString(from: newTime)
        selectedTime = minutes == -1 ? "Forever" : "Stop at \(formatter)"
    }
    
    var body: some View {
        VStack {
            Menu {
                ForEach(TimeConstants.options) { item in
                    Button {
                        addTime(item.value)
                        selected = item.label
                        isCaffeineOn = true
                        SleepManager.shared.requestSleepAssertion()
                    }label:{
                        HStack {
                         Text(item.label)
                            if selected == item.label {
                                Image(systemName: "checkmark")
                                  .foregroundColor(.blue)
                                }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: 100, maxHeight: 100)
                Button("Customize") {
                    showingTime = true
                }
                
            } label: {
                Text(selected)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                
            }
            .menuStyle(.automatic)
            .padding(10)
            .frame(maxWidth: 150, maxHeight: 60)
            .popover(isPresented: $showingTime) {
                CustomTimePickerView(selected: $selected)
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedTime: String = "";
    @Previewable @State var isCaffeineOn: Bool = false;

    DropDownMenu(selectedTime: $selectedTime, isCaffeineOn:$isCaffeineOn)
}
