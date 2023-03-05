// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
public enum WatchDesignSystemFontFamily {
  public enum NotoSansKR {
    public static let black = WatchDesignSystemFontConvertible(name: "NotoSansKR-Black", family: "Noto Sans KR", path: "NotoSansKR-Black.otf")
    public static let bold = WatchDesignSystemFontConvertible(name: "NotoSansKR-Bold", family: "Noto Sans KR", path: "NotoSansKR-Bold.otf")
    public static let light = WatchDesignSystemFontConvertible(name: "NotoSansKR-Light", family: "Noto Sans KR", path: "NotoSansKR-Light.otf")
    public static let medium = WatchDesignSystemFontConvertible(name: "NotoSansKR-Medium", family: "Noto Sans KR", path: "NotoSansKR-Medium.otf")
    public static let regular = WatchDesignSystemFontConvertible(name: "NotoSansKR-Regular", family: "Noto Sans KR", path: "NotoSansKR-Regular.otf")
    public static let thin = WatchDesignSystemFontConvertible(name: "NotoSansKR-Thin", family: "Noto Sans KR", path: "NotoSansKR-Thin.otf")
    public static let all: [WatchDesignSystemFontConvertible] = [black, bold, light, medium, regular, thin]
  }
  public static let allCustomFonts: [WatchDesignSystemFontConvertible] = [NotoSansKR.all].flatMap { $0 }
  public static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

public struct WatchDesignSystemFontConvertible {
  public let name: String
  public let family: String
  public let path: String

  #if os(OSX)
  public typealias Font = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Font = UIFont
  #endif

  public func font(size: CGFloat) -> Font {
    guard let font = Font(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  public func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return Bundle.module.url(forResource: path, withExtension: nil)
  }
}

public extension WatchDesignSystemFontConvertible.Font {
  convenience init?(font: WatchDesignSystemFontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}
// swiftlint:enable all
// swiftformat:enable all
