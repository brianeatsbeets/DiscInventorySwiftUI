//
//  DiscRow.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

import SwiftUI

struct DiscRow: View {
    
    //var inBag: Bool = false
    let disc: Disc
    
    var body: some View {
        HStack {
            if let data = disc.imageData,
               let image = UIImage(data: data) {
                Image(uiImage: image)
            } else {
                Circle()
                    .fill(.black)
                    .frame(width: 50, height: 50)
                    .overlay(Circle().stroke(Color(hex: disc.colorString ?? "") ?? .black, lineWidth: 4))
                    .padding([.leading])
                    .padding([.trailing], 5)
            }
            
            VStack(alignment: .leading) {
                Text(disc.name)
                    .bold()
                Text("\(disc.manufacturer) | \(disc.plastic) | \(String(format: "%.0f", disc.weightInGrams))g")
                Text("\(disc.type.rawValue) - \(String(format: "%.0f", disc.speed)) | \(String(format: "%.0f", disc.glide)) | \(String(format: "%.0f", disc.turn)) | \(String(format: "%.0f", disc.fade))")
            }
            
            Spacer()
            
            VStack {
                Text("In Bag")
                Button {
                    //disc.inBag.toggle()
                } label: {
                    Image(systemName: disc.inBag ? "checkmark.circle.fill" : "circle")
                        .imageScale(.large)
                }
            }
            .padding([.trailing])
        }
    }
}

struct DiscRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscRow(disc: Disc(name: "Aviar", colorString: Color(.orange).toHex(), type: .putter, manufacturer: "Innova", plastic: "DX", weightInGrams: 175, speed: 2, glide: 3, turn: 0, fade: 1, condition: .great, notes: "", inBag: true))
    }
}
