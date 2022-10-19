//
//  Disc.swift
//  DiscInventorySwiftUI
//
//  Created by Aguirre, Brian P. on 10/18/22.
//

// TODO: Create Color property to prevent needing to always call Color.toHex() and Color(hex:)

import Foundation
import SwiftUI
import UIKit

struct Disc: Identifiable, Equatable, Codable {
    
    // MARK: - Properties
    
    var id = UUID()
    var name: String
    var colorString: String?
    var imageData: Data?
    var type: DiscType
    var manufacturer: String
    var plastic: String
    var weightInGrams: Float
    var speed: Float
    var glide: Float
    var turn: Float
    var fade: Float
    var condition: Condition
    var notes: String
    var inBag: Bool
    
    // Define archival directory
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("discs").appendingPathExtension("plist")
    
    // MARK: - Utility functions
    
    // Load disc collection
    static func loadDiscs() -> [Disc]? {
        guard let codedDiscs = try? Data(contentsOf: archiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Disc>.self, from: codedDiscs)
    }
    
    // Save disc collection
    static func saveDiscs(_ discs: [Disc]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedDiscs = try? propertyListEncoder.encode(discs)
        try? codedDiscs?.write(to: archiveURL, options: .noFileProtection)
    }
}

// MARK: Enums

// This enum provides a collection of disc types
enum DiscType: String, Codable, CaseIterable {
    case putter = "Putter"
    case midrange = "Midrange"
    case fairway = "Fairway"
    case distance = "Distance"
    
    // Return the index of a given option in the allCases array
    func getIndex() -> Self.AllCases.Index {
        return Self.allCases.firstIndex(of: self)!
    }
}

// This enum provides a collection of disc conditions
enum Condition: String, Codable, CaseIterable {
    case great = "Great"
    case good = "Good"
    case fair = "Fair"
    case poor = "Poor"
    
    // Return the index of a given option in the allCases array
    func getIndex() -> Self.AllCases.Index {
        return Self.allCases.firstIndex(of: self)!
    }
}
