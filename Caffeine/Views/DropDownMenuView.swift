//
//  DropDownMenuView.swift
//  Caffeine
//
//  Created by Alfy on 29/03/2026.
//
import SwiftUI

struct DropDownMenuView: View {
    @State private var showingCustomize = false
    @Binding  var selected: String
    @Binding var sleectedTime: Int
    @Binding var isEspressoOn: Bool

    var body: some View {
        VStack {
            Menu {
                ForEach(TimeConstants.options) { item in
                    Button {
                        sleectedTime = item.value
                        selected = item.label
                        isEspressoOn = true
                    } label: {
                        HStack {
                            Text(item.label)
                            if selected == item.label {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
                Divider()
                
                Button("Customize") {
                    showingCustomize = true
                }
            } label: {
                Text(selected)
                    .font(.system(size: 14, weight: .light, design: .rounded))
            }
            .menuStyle(.automatic)
            .padding(.top, 5)
            .padding(.bottom, 8)
            .frame(maxWidth: 150, maxHeight: 60)
            .popover(isPresented: $showingCustomize) {
                CustomTimePickerView(selected: $selected, sleectedTime: $sleectedTime)
            }
        }
    }
}

#Preview {
    @Previewable @State var sleectedTime: Int = 0
    @Previewable @State var isEspressoOn: Bool = false
    @Previewable @State var selected: String = "Activate for"
    DropDownMenuView(selected: $selected, sleectedTime: $sleectedTime, isEspressoOn: $isEspressoOn)
}
