//
//  SwiftUIView.swift
//  
//
//  Created by Thameem Hassan on 2/28/23.
//

import SwiftUI

@available(macOS 11.0, *)
struct HSVColorPicker: View {
    @State public var showColorPicker = false
    @State public var colorSelection : Color = .white
    @State public var hue : Double = 0
    @State public var brightness : Double = 1.0
    @State public var saturation : Double = 0.0
    @State public var wheelLocation = CGPoint(x: 90.0, y: 90.0)
    @State public var sliderLocation : Double = 10.0
    static var text : String = "Hello, World!"
    
    
    public var body: some View {
            Button{
                showColorPicker.toggle()
            }label:{
                HStack{
                    Circle()
                        .fill(colorSelection)
                        .frame(width: 20.0, height: 20.0)
                    Text(colorSelection.toHexString())
                }
            }.buttonStyle(.borderless)
                .popover(isPresented: $showColorPicker, arrowEdge: .bottom) {
                    MainView(
                        colorSelection: $colorSelection,
                        hue: $hue,
                        brightness: $brightness,
                        saturation: $saturation,
                        wheelLocation: $wheelLocation,
                        sliderLocation: $sliderLocation
                    )
                }
       
    }
}

@available(macOS 11.0, *)
struct HSVColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        HSVColorPicker()
    }
}
