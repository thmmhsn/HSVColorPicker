//
//  ContentView.swift
//  MacTest
//
//  Created by Thameem Hassan on 2/28/23.
//

import SwiftUI
import HSVColorPicker

struct ContentView: View {
    @State var colorSelection : Color = .red
    var body: some View {
        HSVColorPicker(colorSelection: $colorSelection)  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
