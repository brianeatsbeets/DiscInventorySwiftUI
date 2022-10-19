//
//  InventoryView.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct InventoryView: View {
    
    @EnvironmentObject var inventory: Inventory
    
    var body: some View {
        List {
            ForEach(inventory.discs) { disc in
                NavigationLink(destination: DiscDetailView(disc: disc)) {
                    DiscRow(disc: disc)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView()
    }
}
