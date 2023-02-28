//
//  BrightnessSlider.swift
//  ColorPickerDemo
//
//  Created by Thameem Hassan on 2/26/23.
//

import SwiftUI

@available(macOS 11.0, *)
struct BrightnessSlider: View {
    @Binding public var colorSelection : Color
    @Binding var location: Double
    @Binding public var hue : Double
    @Binding public var saturation : Double
    @Binding public var brightness : Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7.0)
                .stroke(.gray.opacity(0.5), lineWidth: 2)
                .frame(width: 200.0, height: 30.0)
            
            Rectangle()
                .fill(LinearGradient(colors: [Color(hue: hue, saturation: saturation, brightness: 1.0), .black], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(7.0)
                .frame(width: 200.0, height: 30.0)
            
            RoundedRectangle(cornerRadius: 4.0)
                .strokeBorder(.white, lineWidth: 3.0)
                .frame(width: 20.0, height: 30.0)
                
                .position(x: location, y:15.0)
                .shadow(color:.black.opacity(0.4), radius: 1.5)
        }
        .onAppear{
            print(brightness)
        }
        .gesture(dragGesture)
        .frame(width: 200.0, height: 30.0)
    }
    
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0)
            .onChanged { val in
                let xVal = val.location.x
                let newXPos = max(min(xVal,190.0),10.0)
                location = newXPos
                let britVal = 1.0 - (xVal / 190.0)
                if britVal >= 0.0 && britVal <= 1.0{
                    brightness = britVal
                }
                colorSelection = Color(hue: hue, saturation: saturation, brightness: brightness)
            }
    }
}

@available(macOS 11.0, *)
struct BrightnessSlider_Previews: PreviewProvider {
    static var previews: some View {
        BrightnessSlider(colorSelection: .constant(.red), location: .constant(10), hue: .constant(2.0), saturation: .constant(1.0), brightness: .constant(1.0))
    }
}
