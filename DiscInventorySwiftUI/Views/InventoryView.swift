//
//  InventoryView.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct InventoryView: View {
    
    @EnvironmentObject var inventory: Inventory
    @State private var shouldCreateNewDisc = false
    @State private var discToEdit: Disc?
    
    var dummyInventory = [
        Disc(name: "Aviar", colorString: Color(.orange).toHex(), type: .putter, manufacturer: "Innova", plastic: "DX", weightInGrams: 175, speed: 2, glide: 3, turn: 0, fade: 1, condition: .great, notes: "", inBag: true),
        Disc(name: "Wraith", colorString: Color(.green).toHex(), type: .distance, manufacturer: "Innova", plastic: "Halo", weightInGrams: 171, speed: 11, glide: 5, turn: -1, fade: 3, condition: .good, notes: "", inBag: true)
    ]
    
    var body: some View {
        NavigationView {
            List(dummyInventory) { disc in
                DiscRow(disc: disc)
                .onTapGesture {
                    discToEdit = disc
                }
            }
            .navigationTitle("Discs")
            .listStyle(.grouped)
            .fullScreenCover(item: $discToEdit, content: { disc in
                NavigationView {
                    DiscDetailView(disc: disc)
                }
            })
            .toolbar {
                Button {
                    shouldCreateNewDisc = true
                    print("New Disc")
                } label: {
                    Image(systemName: "plus")
                }
            }
            .fullScreenCover(isPresented: $shouldCreateNewDisc) {
                NavigationView {
                    DiscDetailView(disc: nil)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView().environmentObject(Inventory())
    }
}
