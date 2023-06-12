import SwiftUI
import DesignSystem

public struct DMSSeatButtonStyle: ButtonStyle {
    public enum Style {
        case available
        case unavailable
        case inUse
        case empty
    }
    var style: Style
    var color: Color
    var isSelected: Bool

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .available:
            return AnyView(AvailableButton(configuration: configuration, color: color, isSelected: isSelected))
        case .unavailable:
            return AnyView(UnAvailableButton(configuration: configuration, color: color))
        case .inUse:
            return AnyView(InUseButton(configuration: configuration, color: color))
        case .empty:
            return AnyView(EmptyButton())
        }
    }
}

// MARK: - Available
extension DMSSeatButtonStyle {
    struct AvailableButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        let isSelected: Bool

        var body: some View {
            ZStack {
                if isSelected {
                    Circle()
                        .strokeBorder(color)
                } else {
                    Circle()
                        .foregroundColor(color)
                }

                configuration.label
                    .dmsFont(.etc(.overline), color: isSelected ? .GrayScale.gray7 : .GrayScale.gray1)
            }
            .frame(width: 40, height: 40)
            .dmsShadow(style: .surface)
        }
    }
}

// MARK: - UnAvailable
extension DMSSeatButtonStyle {
    struct UnAvailableButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color

        var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(.GrayScale.gray4)

                Text("불가")
                    .dmsFont(.etc(.overline), color: .GrayScale.gray1)
            }
            .frame(width: 40, height: 40)
            .dmsShadow(style: .surface)

        }
    }
}

// MARK: - InUse
extension DMSSeatButtonStyle {
    struct InUseButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color

        var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .opacity(0.4)

                configuration.label
                    .dmsFont(.etc(.overline), color: .GrayScale.gray1)
            }
            .frame(width: 40, height: 40)
            .dmsShadow(style: .surface)

        }
    }
}

// MARK: - Empty
extension DMSSeatButtonStyle {
    struct EmptyButton: View {
        var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(.clear)
            }
            .frame(width: 40, height: 40)

        }
    }
}
