//
//  DiscDetailView.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct DiscDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var nameText = ""
    @State private var discColor = "Blue"
    @State private var discType = "Putter"
    @State private var manufacturer = ""
    @State private var plastic = ""
    @State private var speed = ""
    @State private var glide = ""
    @State private var turn = ""
    @State private var fade = ""
    @State private var weight = ""
    @State private var condition = "Great"
    @State private var notes = ""
    @State private var inBag = true
    
    let disc: Disc?
    let discColors = ["Blue", "Green", "Yellow"]
    let discTypes = ["Putter", "Midrange", "Fairway", "Distance"]
    let conditions = ["Great", "Good", "Fair", "Poor"]
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $nameText)
            }
            
            Section("Color") {
                Picker("", selection: $discColor) {
                    ForEach(discColors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Type") {
                Picker("Type", selection: $discType) {
                    ForEach(discTypes, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Manufacturer") {
                TextField("Manufacturer", text: $manufacturer)
            }
            
            Section("Plastic") {
                TextField("Plastic", text: $plastic)
            }
            
            Section("Flight Numbers") {
                HStack {
                    VStack {
                        TextField("#", text: $speed)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                        Text("Speed")
                    }
                    
                    VStack {
                        TextField("#", text: $glide)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                        Text("Glide")
                    }
                    
                    VStack {
                        TextField("#", text: $turn)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                        Text("Turn")
                    }
                    
                    VStack {
                        TextField("#", text: $fade)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                        Text("Fade")
                    }
                }
            }
            
            Section("Weight") {
                TextField("Weight", text: $weight)
            }
            
            Section("Condition") {
                Picker("Condition", selection: $condition) {
                    ForEach(conditions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Notes") {
                TextField("Notes", text: $notes)
            }
            
            Section("In Bag") {
                Toggle(isOn: $inBag) {
                    Text("In Bag")
                }
            }
        }
        .navigationTitle(disc != nil ? disc!.name : "New Disc")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

struct DiscDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DiscDetailView(disc: Disc(name: "Aviar", type: .putter, manufacturer: "Innova", plastic: "DX", weightInGrams: 175, speed: 2, glide: 3, turn: 0, fade: 1, condition: .great, notes: "", inBag: true))
        }
    }
}
