import SwiftUI

protocol DMSFontable {
    var size: CGFloat { get }
    var weight: Font.Weight { get }
}

public enum DMSTypoStyle {
    case title(DMSTypoStyle.Title)
    case text(DMSTypoStyle.Text)

    public enum Title: CGFloat, DMSFontable {
        case extraLarge = 36
        case large = 30
        case medium = 24
        case small = 22
        case extraSmall = 18
    }

    public enum Text: CGFloat, DMSFontable {
        case twoExtraLarge = 22
        case extraLarge = 20
        case large = 18
        case medium = 16
        case small = 14
        case extraSmall = 12
        case twoExtraSmall = 10
    }
}

// MARK: - Title
public extension DMSTypoStyle.Title {
    var size: CGFloat {
        self.rawValue
    }

    var weight: Font.Weight {
        switch self {
        case .extraLarge, .large, .medium, .extraSmall:
            return .medium

        case .small:
            return .bold
        }
    }
}

// MARK: - Text
public extension DMSTypoStyle.Text {
    var size: CGFloat {
        self.rawValue
    }

    var weight: Font.Weight {
        switch self {
        case .twoExtraLarge, .extraLarge, .large, .medium, .small, .extraSmall, .twoExtraSmall:
            return .regular
        }
    }
}