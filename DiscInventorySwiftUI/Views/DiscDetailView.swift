//
//  DiscDetailView.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct DiscDetailView: View {
    
    let disc: Disc
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DiscDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiscDetailView(disc: Disc(name: "Aviar", type: .putter, manufacturer: "Innova", plastic: "DX", weightInGrams: 175, speed: 2, glide: 3, turn: 0, fade: 1, condition: .great, notes: "", inBag: true))
    }
}
