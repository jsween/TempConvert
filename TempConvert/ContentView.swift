//
//  ContentView.swift
//  TempConvert
//
//  Created by Jonathan Sweeney on 9/23/20.
//

import SwiftUI

struct ContentView: View {
    @State private var tempCStr: String = ""
    @State private var showF: Bool = true
    
    private var tempC: Double {
        let cValue = Double(tempCStr) ?? -17.777
        return cValue * 9/5 + 32
    }
    
    private var tempK: Double {
        let cValue = Double(tempCStr) ?? 0
        return cValue + 273.15
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Temperature in Celsius")) {
                    TextField("Enter ° Celsius", text: $tempCStr)
                        .keyboardType(.decimalPad)
                }
                Toggle(isOn: $showF) {
                    Text("Kelvin or Farenheit")
                }
                .toggleStyle(SwitchToggleStyle(tint: .red))
                Section(header: Text(showF ? "'Merican" : "Kelvin")) {
                    Text("\(showF ? tempC : tempK, specifier: "%.1f")° \(showF ? "F" : "K")")
                        .font(.system(size: 40))
                }.foregroundColor(showF ? .blue : .primary)
                
            }.navigationTitle("TempConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
