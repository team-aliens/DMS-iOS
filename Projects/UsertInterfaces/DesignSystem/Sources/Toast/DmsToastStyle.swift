import SwiftUI

public enum DmsToastStyle {
    case info
    case error
    case success
}

public extension DmsToastStyle {
    var icon: Image {
        switch self {
        case .info:
            return Image(systemName: "info.circle")

        case .error:
            return Image(systemName: "exclamationmark.triangle")

        case .success:
            return Image(systemName: "checkmark")
        }
    }

    var iconForeground: Color {
        switch self {
        case .info:
            return .GrayScale.gray7

        case .error:
            return .System.error

        case .success:
            return .PrimaryVariant.darken2
        }
    }

    var textForeground: Color {
        switch self {
        case .info:
            return .GrayScale.gray9

        case .error:
            return .System.error

        case .success:
            return .PrimaryVariant.darken2
        }
    }

    var size: CGSize {
        switch self {
        case .info:
            return .init(width: 20, height: 20)

        case .error:
            return .init(width: 21, height: 18)

        case .success:
            return .init(width: 16, height: 12)
        }
    }
}
