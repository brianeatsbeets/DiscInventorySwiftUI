//
//  DiscInventorySwiftUIApp.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

@main
struct DiscInventorySwiftUIApp: App {
    
    @StateObject var inventory = Inventory()
    
    var body: some Scene {
        WindowGroup {
            InventoryView().environmentObject(inventory)
        }
    }
}
