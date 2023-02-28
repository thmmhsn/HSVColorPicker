//
//  MainView.swift
//  ColorPicker
//
//  Created by Thameem Hassan on 2/25/23.
//

import SwiftUI

@available(macOS 11.0, *)
public struct MainView: View {
    @Binding public var colorSelection : Color
    @Binding public var hue : Double
    @Binding public var brightness : Double
    @Binding public var saturation : Double
    @Binding public var wheelLocation : CGPoint
    @Binding public var sliderLocation : Double
  
    public var body: some View {
        VStack(spacing: 0){
            
            ColorWheelView(colorSelection: $colorSelection, location: $wheelLocation, hue: $hue, saturation: $saturation, brightness: $brightness)
                .padding()
            
            BrightnessSlider(colorSelection: $colorSelection, location: $sliderLocation, hue: $hue, saturation: $saturation, brightness: $brightness)
                .frame(width: 200.0, height: 30.0)
                .padding([.leading, .trailing, .bottom])
            Divider()
            HStack{
                Text(colorSelection.toHexString())
                Spacer()
                Button{
                    let pasteboard = NSPasteboard.general
                    pasteboard.clearContents()
                    pasteboard.setString(colorSelection.toHexString(), forType: .string)
                }label: {
                    Image(systemName: "doc.on.doc")
                }
            }.padding()
             .buttonStyle(.borderless)
        }.padding(.top, 7)
        
    }
}
@available(macOS 11.0, *)
public struct MainView_Previews: PreviewProvider {
    public static var previews: some View {
        MainView(colorSelection: .constant(.red), hue: .constant(0), brightness: .constant(1), saturation: .constant(0), wheelLocation: .constant(CGPoint(x: 0, y: 0)), sliderLocation: .constant(0.0))
    }
}
