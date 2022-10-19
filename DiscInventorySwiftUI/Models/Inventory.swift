//
//  Inventory.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var discs = [Disc]()

    func add(disc: Disc) {
        discs.append(disc)
    }

    func remove(disc: Disc) {
        if let index = discs.firstIndex(of: disc) {
            discs.remove(at: index)
        }
    }
}
