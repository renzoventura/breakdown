//
//  ColorUtils.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import SwiftUI


let primaryColor = Color(hex: "D1A28B")
let secondaryColor = Color(hex: "E6D9CB")
let greyColor = Color(hex: "D9D9D9")

var allColors : [[Color]] = [basicPalette, earthyPalette, naturePalette, seaPalette, sunsetPalette,]

var basicPalette: [Color] = [
    Color.red,
    Color.green,
    Color.blue,
    Color.yellow,
    Color.orange,
    Color.pink,
    Color.purple,
    Color.indigo,
    Color.teal,
    Color.brown
]

var earthyPalette: [Color] = [
    Color.brown,        // Earthy brown
    Color.green,        // Forest green
    Color.beige,        // Sandy beige
    Color.orange,       // Rustic orange
    Color.darkGray,     // Charcoal gray
    Color.olive,        // Olive green
    Color.tan,          // Light tan
    Color.terracotta,   // Terracotta red
    Color.moss,         // Moss green
    Color.copper        // Copper brown
]


var naturePalette: [Color] = [
    Color.green,        // Fresh green
    Color.yellow,       // Sunflower yellow
    Color.skyBlue,      // Sky blue
    Color.earthBrown,   // Earthy brown
    Color.forestGreen,  // Deep green
    Color.dandelion,    // Dandelion yellow
    Color.oceanBlue,    // Ocean blue
    Color.sand,         // Light sandy color
    Color.stone,        // Stone gray
    Color.lavender      // Soft lavender
]

var seaPalette: [Color] = [
    Color.blue,         // Ocean blue
    Color.teal,         // Teal
    Color.cyan,         // Sea foam cyan
    Color.slateGray,    // Slate gray (like a rocky shoreline)
    Color.sand,         // Sandy beige
    Color.mint,         // Fresh mint green
    Color.aqua,         // Aquatic blue
    Color.darkBlue,     // Deep sea blue
    Color.lightBlue,    // Light beachy blue
    Color.pacificBlue   // Pacific Ocean blue
]

var sunsetPalette: [Color] = [
    Color.orange,       // Sunset orange
    Color.red,          // Fiery red
    Color.pink,         // Soft pink
    Color.purple,       // Lavender purple
    Color.yellow,       // Golden yellow
    Color.burgundy,     // Deep red-purple
    Color.gold,         // Rich gold
    Color.magenta,      // Vivid magenta
    Color.indigo,       // Twilight indigo
    Color.peach         // Peachy pink
]

extension Color {
    static let moss = Color(red: 0.6, green: 0.8, blue: 0.2)        // Custom Moss green
    static let terracotta = Color(red: 0.9, green: 0.4, blue: 0.3)  // Custom Terracotta red
    static let copper = Color(red: 0.72, green: 0.45, blue: 0.2)    // Custom Copper brown
    static let earthBrown = Color(red: 0.6, green: 0.3, blue: 0.1)  // Custom Earthy brown
    static let forestGreen = Color(red: 0.13, green: 0.55, blue: 0.13) // Custom Forest green
    static let dandelion = Color(red: 1.0, green: 0.94, blue: 0.0)  // Custom Dandelion yellow
    static let oceanBlue = Color(red: 0.0, green: 0.53, blue: 0.72)  // Custom Ocean blue
    static let stone = Color(red: 0.55, green: 0.55, blue: 0.55)    // Custom Stone gray
    static let lavender = Color(red: 0.9, green: 0.7, blue: 0.9)    // Custom Soft lavender
    static let mint = Color(red: 0.68, green: 1.0, blue: 0.72)      // Custom Mint green
    static let pacificBlue = Color(red: 0.0, green: 0.67, blue: 0.77) // Custom Pacific Ocean blue
    static let slateGray = Color(red: 0.44, green: 0.5, blue: 0.56) // Custom Slate gray
    static let beige = Color(red: 0.96, green: 0.96, blue: 0.86)   // Custom Beige
    static let darkGray = Color(red: 0.33, green: 0.33, blue: 0.33) // Custom Dark Gray
    static let olive = Color(red: 0.5, green: 0.5, blue: 0.0)       // Custom Olive Green
    static let tan = Color(red: 0.82, green: 0.71, blue: 0.55)      // Custom Tan
    static let skyBlue = Color(red: 0.53, green: 0.81, blue: 0.98)  // Custom Sky Blue
    static let sand = Color(red: 0.94, green: 0.89, blue: 0.55)     // Custom Sand
    static let aqua = Color(red: 0.0, green: 1.0, blue: 1.0)        // Custom Aqua
    static let darkBlue = Color(red: 0.0, green: 0.0, blue: 0.55)   // Custom Dark Blue
    static let lightBlue = Color(red: 0.68, green: 0.85, blue: 0.9) // Custom Light Blue
    static let burgundy = Color(red: 0.5, green: 0.0, blue: 0.13)   // Custom Burgundy
    static let gold = Color(red: 1.0, green: 0.84, blue: 0.0)       // Custom Gold
    static let peach = Color(red: 1.0, green: 0.75, blue: 0.5)      // Custom Peach
    static let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)   // Custom Magenta
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: Double
        switch hex.count {
        case 6: // RGB (no alpha)
            (a, r, g, b) = (1,
                            Double((int >> 16) & 0xFF) / 255,
                            Double((int >> 8) & 0xFF) / 255,
                            Double(int & 0xFF) / 255)
        case 8: // ARGB
            (a, r, g, b) = (Double((int >> 24) & 0xFF) / 255,
                            Double((int >> 16) & 0xFF) / 255,
                            Double((int >> 8) & 0xFF) / 255,
                            Double(int & 0xFF) / 255)
        default:
            (a, r, g, b) = (1, 1, 1, 1) // Default to white
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

