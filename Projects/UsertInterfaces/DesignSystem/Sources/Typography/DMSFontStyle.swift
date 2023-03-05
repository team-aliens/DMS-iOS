import SwiftUI

protocol DMSFontable {
    var size: CGFloat { get }
    var weight: DMSFontWeight { get }
}

public enum DMSFontWeight: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
}

public enum DMSFontStyle: Hashable {
    case headline(DMSFontStyle.Headline)
    case title(DMSFontStyle.Title)
    case body(DMSFontStyle.Body)
    case etc(DMSFontStyle.Etc)

    public enum Headline: CGFloat, DMSFontable {
        case headline1 = 36
        case headline2 = 30
        case headline3 = 24
    }

    public enum Title: CGFloat, DMSFontable {
        case title1 = 22
        case title2 = 20
        case subTitle1 = 18
    }

    public enum Body: CGFloat, DMSFontable {
        case body1 = 18
        case body2 = 16
        case body3 = 14
    }

    public enum Etc: CGFloat, DMSFontable {
        case caption = 12
        case overline = 10
        case button = 14
    }
}

// MARK: - FontableSize
extension DMSFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}

// MARK: - Headline
public extension DMSFontStyle.Headline {
    var weight: DMSFontWeight {
        switch self {
        case .headline1, .headline2, .headline3:
            return .medium
        }
    }
}

// MARK: - Title
public extension DMSFontStyle.Title {
    var weight: DMSFontWeight {
        switch self {
        case .title1, .title2, .subTitle1:
            return .bold
        }
    }
}

// MARK: - Text
public extension DMSFontStyle.Body {
    var weight: DMSFontWeight {
        switch self {
        case .body1, .body2, .body3:
            return .regular
        }
    }
}

// MARK: - Button
public extension DMSFontStyle.Etc {
    var weight: DMSFontWeight {
        switch self {
        case .caption:
            return .regular

        case .overline, .button:
            return .bold
        }
    }
}
