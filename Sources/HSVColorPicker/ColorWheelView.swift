//
//  ColorWheelView.swift
//  
//
//  Created by Thameem Hassan on 2/25/23.
//

import SwiftUI

@available(macOS 11.0, *)
public struct ColorWheelView: View {
    @Binding public var colorSelection : Color

    @Binding public var location: CGPoint
    public var radius = 90.0
    @State public var hsColor: Color = Color(.white)
    @Binding public var hue : Double
    @Binding public var saturation : Double
    @Binding public var brightness : Double
    

    public var body: some View{
        ZStack{
            Circle()
                .fill(
                    AngularGradient(colors: [
                        Color(hue: 1.0, saturation: 1, brightness: 1.0),
                        Color(hue: 0.9, saturation: 1, brightness: 1.0),
                        Color(hue: 0.8, saturation: 1, brightness: 1.0),
                        Color(hue: 0.7, saturation: 1, brightness: 1.0),
                        Color(hue: 0.6, saturation: 1, brightness: 1.0),
                        Color(hue: 0.5, saturation: 1, brightness: 1.0),
                        Color(hue: 0.4, saturation: 1, brightness: 1.0),
                        Color(hue: 0.3, saturation: 1, brightness: 1.0),
                        Color(hue: 0.2, saturation: 1, brightness: 1.0),
                        Color(hue: 0.1, saturation: 1, brightness: 1.0),
                        Color(hue: 0.0, saturation: 1, brightness: 1.0)
                    ], center: .center)
                    
                )
                
                .overlay(
                    Circle()
                        .fill(
                            RadialGradient(colors: [
                                Color.white,
                                Color.white.opacity(0.0)
                            ], center: .center, startRadius: 0, endRadius: 90)
                        )
 
                )
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 0.5)
                )
                .frame(width: 180.0, height: 180.0)
                .foregroundColor(.white)
            
            //control
            Circle()
                .strokeBorder(.black, lineWidth: 1.0)
            
                .foregroundColor(.clear)
            
                .frame(width: 15.0, height: 15.0)
                .position(location)
            
            
        }
        .frame(width: 180, height: 180)
        .gesture(dragGesture)
    }
    
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0)
            .onChanged { val in
                let startLocation = CGPoint(x: 90, y: 90)
                
                let distanceX = val.location.x - startLocation.x
                let distanceY = val.location.y - startLocation.y
                
                let dir = CGPoint (x: distanceX, y: distanceY)
                var distance = sqrt(distanceX * distanceX + distanceY * distanceY)
                
                if distance < radius {
                    location.x = val.location.x
                    location.y = val.location.y
                } else {
                    let clampedX = dir.x / distance * radius
                    let clampedY = dir.y / distance * radius

                    location = CGPoint (x: startLocation.x + clampedX,
                                        y: startLocation.y + clampedY)
                    distance = radius
                }
                
                if distance == 0 {return }
                var angle = Angle(radians: -Double(atan(dir.y / dir.x)))
                if dir.x < 0{
                    angle.degrees += 180
                }else if dir.x > 0 && dir.y > 0{
                    angle.degrees += 360
                }
                
                let hueVal = angle.degrees / 360
                hue = hueVal
                
                let saturationVal = Double(distance / radius)
                saturation = saturationVal
                colorSelection = Color(hue: hue, saturation: saturation, brightness: brightness)
                hsColor = Color(hue: hue, saturation: saturation, brightness: brightness)
            }
            
    }
}

@available(macOS 11.0, *)
public struct ColorWheelView_Preview: PreviewProvider {
    public static var previews: some View {
        ColorWheelView(colorSelection: .constant(.red), location: .constant(CGPoint(x: 0, y: 0)), hue: .constant(0.0), saturation: .constant(0.0), brightness: .constant(0.0))
    }
}
