//
//  DiscDetailView.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct DiscDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var nameText: String
    @State private var discColor: String
    @State private var discType: String
    @State private var manufacturer: String
    @State private var plastic: String
    @State private var speed: String
    @State private var glide: String
    @State private var turn: String
    @State private var fade: String
    @State private var weight: String
    @State private var condition: String
    @State private var notes: String
    @State private var inBag: Bool
    
    let disc: Disc?
    let discColors = ["Blue", "Green", "Yellow"]
    let discTypes = ["Putter", "Midrange", "Fairway", "Distance"]
    let conditions = ["Great", "Good", "Fair", "Poor"]
    
    init(disc: Disc?) {
        self.disc = disc
        
        self._nameText = State(initialValue: disc?.name ?? "")
        self._discColor = State(initialValue: "Blue")
        self._discType = State(initialValue: disc?.type.rawValue ?? "Putter")
        self._manufacturer = State(initialValue: disc?.manufacturer ?? "")
        self._plastic = State(initialValue: disc?.plastic ?? "")
        self._speed = State(initialValue: disc?.speed.description ?? "")
        self._glide = State(initialValue: disc?.glide.description ?? "")
        self._turn = State(initialValue: disc?.turn.description ?? "")
        self._fade = State(initialValue: disc?.fade.description ?? "")
        self._weight = State(initialValue: disc?.weightInGrams.description ?? "")
        self._condition = State(initialValue: disc?.condition.rawValue ?? "Great")
        self._notes = State(initialValue: disc?.notes ?? "")
        self._inBag = State(initialValue: disc?.inBag ?? true)
    }
    
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
            DiscDetailView(disc: Disc(name: "Aviar", type: .putter, manufacturer: "Innova", plastic: "DX", weightInGrams: 175, speed: 2, glide: 3, turn: 0, fade: 1, condition: .great, notes: "This is a test disc", inBag: true))
        }
    }
}
