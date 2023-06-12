import SwiftUI

public extension Color {
    struct System { }
}

public extension Color.System {
    static let background: Color = WatchDesignSystemAsset.SystemColor.background.swiftUIColor
    static let onBackground: Color = WatchDesignSystemAsset.SystemColor.onBackground.swiftUIColor

    static let surface: Color = WatchDesignSystemAsset.SystemColor.surface.swiftUIColor
    static let onSurface: Color = WatchDesignSystemAsset.SystemColor.onSurface.swiftUIColor

    static let error: Color = WatchDesignSystemAsset.ErrorColor.error.swiftUIColor
    static let onError: Color = WatchDesignSystemAsset.SystemColor.onError.swiftUIColor
    static let errorContainer: Color = WatchDesignSystemAsset.SystemColor.errorContainer.swiftUIColor
    static let onErrorContainer: Color = WatchDesignSystemAsset.SystemColor.onErrorContainer.swiftUIColor

    static let primary: Color = WatchDesignSystemAsset.PrimaryColor.primary.swiftUIColor
    static let onPrimary: Color = WatchDesignSystemAsset.SystemColor.onPrimary.swiftUIColor
    static let primaryContainer: Color = WatchDesignSystemAsset.SystemColor.primaryContainer.swiftUIColor
    static let onPrimaryContainer: Color = WatchDesignSystemAsset.SystemColor.onPrimaryContainer.swiftUIColor

    static let backgroundTitle: Color = WatchDesignSystemAsset.SystemColor.onBackgroundVariantText.swiftUIColor
    static let backgroundText: Color = WatchDesignSystemAsset.SystemColor.onBackgroundVariantEtc.swiftUIColor
    static let surfaceTitle: Color = WatchDesignSystemAsset.SystemColor.onSurfaceVariantText.swiftUIColor
    static let surfaceText: Color = WatchDesignSystemAsset.SystemColor.onSurfaceVariantEtc.swiftUIColor

    static let icon: Color = WatchDesignSystemAsset.SystemColor.icon.swiftUIColor
    static let line: Color = WatchDesignSystemAsset.SystemColor.line.swiftUIColor
}
