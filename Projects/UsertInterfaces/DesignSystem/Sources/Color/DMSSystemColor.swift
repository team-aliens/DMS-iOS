import SwiftUI

public extension Color {
    struct System { }
}

public extension Color.System {
    static let background: Color = DesignSystemAsset.SystemColor.backgrond.suiColor
    static let surface: Color = DesignSystemAsset.SystemColor.surface.suiColor
    static let error: Color = DesignSystemAsset.SystemColor.error.suiColor
    static let onError: Color = DesignSystemAsset.SystemColor.onError.suiColor
    static let onPrimary: Color = DesignSystemAsset.SystemColor.onPrimary.suiColor
    static let onBackground: Color = DesignSystemAsset.SystemColor.onBackground.suiColor
    static let title: Color = DesignSystemAsset.SystemColor.title.suiColor
    static let text: Color = DesignSystemAsset.SystemColor.text.suiColor
    static let iconActive: Color = DesignSystemAsset.SystemColor.iconActive.suiColor
    static let iconInactive: Color = DesignSystemAsset.SystemColor.iconInactive.suiColor
    static let line: Color = DesignSystemAsset.SystemColor.line.suiColor
}
