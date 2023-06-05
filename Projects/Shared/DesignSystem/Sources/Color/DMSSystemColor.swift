import SwiftUI

public extension Color {
    struct System { }
}

public extension Color.System {
    static let background: Color = DesignSystemAsset.SystemColor.background.suiColor
    static let onBackground: Color = DesignSystemAsset.SystemColor.onBackground.suiColor

    static let surface: Color = DesignSystemAsset.SystemColor.surface.suiColor
    static let onSurface: Color = DesignSystemAsset.SystemColor.onSurface.suiColor

    static let error: Color = DesignSystemAsset.ErrorColor.error.suiColor
    static let onError: Color = DesignSystemAsset.SystemColor.onError.suiColor
    static let errorContainer: Color = DesignSystemAsset.SystemColor.errorContainer.suiColor
    static let onErrorContainer: Color = DesignSystemAsset.SystemColor.onErrorContainer.suiColor

    static let primary: Color = DesignSystemAsset.PrimaryColor.primary.suiColor
    static let onPrimary: Color = DesignSystemAsset.SystemColor.onPrimary.suiColor
    static let primaryContainer: Color = DesignSystemAsset.SystemColor.primaryContainer.suiColor
    static let onPrimaryContainer: Color = DesignSystemAsset.SystemColor.onPrimaryContainer.suiColor

    static let backgroundTitle: Color = DesignSystemAsset.SystemColor.onBackgroundVariantText.suiColor
    static let backgroundText: Color = DesignSystemAsset.SystemColor.onBackgroundVariantEtc.suiColor
    static let surfaceTitle: Color = DesignSystemAsset.SystemColor.onSurfaceVariantText.suiColor
    static let surfaceText: Color = DesignSystemAsset.SystemColor.onSurfaceVariantEtc.suiColor

    static let icon: Color = DesignSystemAsset.SystemColor.icon.suiColor
    static let line: Color = DesignSystemAsset.SystemColor.line.suiColor
}
