//
//  ColorToString.swift
//  ColorPickerDemo
//
//  Created by Thameem Hassan on 2/26/23.
//

import SwiftUI


@available(macOS 11.0, *)
extension Color {
    func toHexString() -> String {
        guard let components = NSColor(self).cgColor.components, components.count >= 3 else {
            return "FFFFFF" // Return white as default if color conversion fails
        }
        let red = Int(components[0] * 255.0)
        let green = Int(components[1] * 255.0)
        let blue = Int(components[2] * 255.0)
        return String(format: "%02X%02X%02X", red, green, blue)
    }
}
