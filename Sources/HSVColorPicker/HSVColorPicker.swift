//
//  SwiftUIView.swift
//  
//
//  Created by Thameem Hassan on 2/28/23.
//

import SwiftUI

@available(macOS 11.0, *)
public struct HSVColorPicker: View {
    @State public var showColorPicker : Bool = false
    @State public var hue : Double = 0
    @Binding public var colorSelection : Color
    @State public var brightness : Double = 1.0
    @State public var saturation : Double = 0.0
    @State public var wheelLocation : CGPoint = CGPoint(x: 90.0, y: 90.0)
    @State public var sliderLocation : Double = 10.0
    static var text : String = "Hello, World!"
    
    public init(colorSelection:Binding<Color>){
        self._colorSelection = colorSelection
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
        HSVColorPicker(colorSelection: .constant(.red))
    }
}
