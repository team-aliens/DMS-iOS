import SwiftUI
import DataMappingModule

public struct DMSSeatButtonStyle: ButtonStyle {
    var style: SeatStatusType
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .available:
            return AnyView(AvailableButton(configuration: configuration, color: color))
        case .unavailable:
            return AnyView(UnAvailableButton(configuration: configuration, color: color))
        case .inUse:
            return AnyView(InUseButton(configuration: configuration, color: color))
        case .empty:
            return AnyView(EmptyButton())
        case .isSelect:
            return AnyView(IsSelectButton(configuration: configuration, color: color))
        }
    }
}

// MARK: - Usage
extension Button {
    func dmsStyle(_ style: SeatStatusType, color: Color) -> some View {
        self.buttonStyle(DMSSeatButtonStyle(style: style, color: color))
    }
}

// MARK: - Available
extension DMSSeatButtonStyle {
    struct AvailableButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color

        var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(color)

                configuration.label
                    .dmsFont(.etc(.overline), color: .GrayScale.gray1)
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

// MARK: - IsSelect
extension DMSSeatButtonStyle {
    struct IsSelectButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color

        var body: some View {
            ZStack {
                Circle()
                    .stroke(color, lineWidth: 4)

                configuration.label
                    .dmsFont(.etc(.overline), color: .GrayScale.gray7)
            }
            .frame(width: 40, height: 40)
            .dmsShadow(style: .surface)
        }
    }
}
