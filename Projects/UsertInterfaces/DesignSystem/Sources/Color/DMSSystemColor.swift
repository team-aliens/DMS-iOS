import SwiftUI

public extension Color {
    struct SystemColor { }
}

public extension Color.SystemColor {
    static let background: Color = Color("Backgrond")
    static let surface: Color = Color("Surface")
    static let error: Color = Color("Error")
    static let onError: Color = Color("OnError")
    static let onPrimary: Color = Color("OnPrimary")
    static let onBackground: Color = Color("OnBackground")
    static let title: Color = Color("Title")
    static let text: Color = Color("Text")
    static let iconActive: Color = Color("IconActive")
    static let iconInactive: Color = Color("IconInactive")
    static let line: Color = Color("Line")
}
