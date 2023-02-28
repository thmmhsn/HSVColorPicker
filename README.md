HSVColorPicker
===


![SwiftUI Support](https://shields.io/badge/SwiftUI-macOS%20v11.0%20-green?logo=Swift&style=flat)

A simple popup color wheel for macOS.

![HSVColorpicker example Screenshot](https://user-images.githubusercontent.com/95959772/221931675-c705438c-b272-4ad4-88e9-8fb604d24a2e.png)


## Installation

You can add HSVColorPicker to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Packages…
2. Enter https://github.com/thmmhsn/HSVColorPicker in Search or Enter Package URL search field
3. Link `Markdown` to your application target

Or add the following to `Package.swift`:

```swift
.package(url: "https://github.com/thmmhsn/HSVColorPicker", from: "1.0.0")
```

Or [add the package in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Usage

```swift
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
```

## License

Licensed under the MIT License.
