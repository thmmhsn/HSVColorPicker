//
//  SwiftUIView.swift
//  
//
//  Created by Thameem Hassan on 2/28/23.
//

import SwiftUI

@available(macOS 11.0, *)
public struct HSVColorPicker: View {
    @State public var showColorPicker : Bool
    @State public var colorSelection : Color
    @State public var hue : Double
    @State public var brightness : Double
    @State public var saturation : Double
    @State public var wheelLocation : CGPoint
    @State public var sliderLocation : Double
    static var text : String = "Hello, World!"
    
    public init(){
        showColorPicker = false
        colorSelection = .white
        hue = 0
        brightness = 1.0
        saturation = 0.0
        wheelLocation = CGPoint(x: 90.0, y: 90.0)
        sliderLocation = 10.0
    }
    public var body: some View {
            Button{
                showColorPicker.toggle()
            }label:{
                HStack{
                    Circle()
                        .fill(colorSelection)
                        .frame(width: 20.0, height: 20.0)
                    Text(colorSelection.toHexString())
                    Spacer()
                }.frame(width: 90.0)
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
public struct HSVColorPicker_Previews: PreviewProvider {
    public static var previews: some View {
        HSVColorPicker()
    }
}
