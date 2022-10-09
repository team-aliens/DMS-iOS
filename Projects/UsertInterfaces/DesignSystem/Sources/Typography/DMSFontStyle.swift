import SwiftUI

protocol DMSFontable {
    var size: CGFloat { get }
    var weight: Font.Weight { get }
}

public enum DMSFontStyle: Hashable {
    case title(DMSFontStyle.Title)
    case text(DMSFontStyle.Text)
    case button(DMSFontStyle.Button)

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

    public enum Button: CGFloat, DMSFontable {
        case `default` = 14
    }
}

// MARK: - FontableSize
extension DMSFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Title
public extension DMSFontStyle.Title {
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
public extension DMSFontStyle.Text {
    var weight: Font.Weight {
        switch self {
        case .twoExtraLarge, .extraLarge, .large, .medium, .small, .extraSmall, .twoExtraSmall:
            return .regular
        }
    }
}

// MARK: - Button
public extension DMSFontStyle.Button {
    var weight: Font.Weight {
        switch self {
        case .`default`:
            return .semibold
        }
    }
}
