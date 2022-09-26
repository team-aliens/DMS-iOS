// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum PrimaryColor {
    public static let darken1 = DesignSystemColors(name: "Darken-1")
    public static let darken2 = DesignSystemColors(name: "Darken-2")
    public static let gray1 = DesignSystemColors(name: "Gray 1")
    public static let gray2 = DesignSystemColors(name: "Gray 2")
    public static let gray3 = DesignSystemColors(name: "Gray 3")
    public static let gray4 = DesignSystemColors(name: "Gray 4")
    public static let gray5 = DesignSystemColors(name: "Gray 5")
    public static let gray6 = DesignSystemColors(name: "Gray 6")
    public static let gray7 = DesignSystemColors(name: "Gray 7")
    public static let gray8 = DesignSystemColors(name: "Gray 8")
    public static let gray9 = DesignSystemColors(name: "Gray 9")
    public static let lighten1 = DesignSystemColors(name: "Lighten-1")
    public static let lighten2 = DesignSystemColors(name: "Lighten-2")
    public static let primary = DesignSystemColors(name: "Primary")
  }
  public enum SystemColor {
    public static let backgrond = DesignSystemColors(name: "Backgrond")
    public static let error = DesignSystemColors(name: "Error")
    public static let iconActive = DesignSystemColors(name: "IconActive")
    public static let iconInactive = DesignSystemColors(name: "IconInactive")
    public static let line = DesignSystemColors(name: "Line")
    public static let onBackground = DesignSystemColors(name: "OnBackground")
    public static let onError = DesignSystemColors(name: "OnError")
    public static let onPrimary = DesignSystemColors(name: "OnPrimary")
    public static let surface = DesignSystemColors(name: "Surface")
    public static let text = DesignSystemColors(name: "Text")
    public static let title = DesignSystemColors(name: "Title")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all
