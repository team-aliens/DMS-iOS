import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct DMSPointEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily

    let entry: DMSPointProvider.Entry

    init(entry: DMSPointProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        widgetBody()
    }

    @ViewBuilder
    func widgetBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            SmallDMSPointWidgetView(entry: entry)

        case .systemMedium:
            MediumDMSPointWidgetView(entry: entry)

        default:
            EmptyView()
        }
    }
}

private struct SmallDMSPointWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSPointProvider.Entry

    var body: some View {
        VStack(spacing: 10) {
            switch entry.displayPointPart {
            case .both:
                bothView()

            case .bonus:
                singlePointView(
                    .bonus,
                    point: entry.bonusPoint,
                    color: .PrimaryVariant.darken2
                )

            case .minus:
                singlePointView(
                    .minus,
                    point: entry.minusPoint,
                    color: .ErrorVariant.darken1
                )
            }
        }
        .padding(12)
    }

    @ViewBuilder
    func bothView() -> some View {
        Group {
            bothPointCardView(
                "상점",
                point: entry.bonusPoint,
                color: .PrimaryVariant.primary
            )

            bothPointCardView(
                "벌점",
                point: entry.minusPoint,
                color: .ErrorVariant.darken1
            )
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.GrayScale.gray1)
                .dmsShadow(style: .surface)
        }
    }

    @ViewBuilder
    func bothPointCardView(
        _ label: String,
        point: Int,
        color: Color
    ) -> some View {
        HStack(alignment: .center) {
            VStack {
                Text(label)
                    .dmsFont(.etc(.caption))

                Spacer()
            }
            .padding(.top, 10)

            Spacer()

            Text("\(point)")
                .dmsFont(.headline(.headline3))
        }
        .foregroundColor(color)
    }

    @ViewBuilder
    func singlePointView(
        _ part: DisplayPointPart,
        point: Int,
        color: Color
    ) -> some View {
        HStack {
            VStack {
                Text(part.display)
                    .dmsFont(.body(.body2))

                Spacer()
            }

            Spacer()

            VStack {
                Spacer()

                Text("\(point)")
                    .dmsFont(.headline(.headline2))
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(color)
    }
}

private struct MediumDMSPointWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSPointProvider.Entry

    var body: some View {
        HStack(spacing: 18) {
            switch entry.displayPointPart {
            case .both:
                Group {
                    pointView(.bonus, point: entry.bonusPoint, color: .PrimaryVariant.darken2)

                    pointView(.minus, point: entry.minusPoint, color: .ErrorVariant.darken1)
                }
                .background {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.GrayScale.gray1)
                        .dmsShadow(style: .surface)
                }

            case .bonus:
                pointView(.bonus, point: entry.bonusPoint, color: .PrimaryVariant.darken2)

            case .minus:
                pointView(.minus, point: entry.minusPoint, color: .ErrorVariant.darken1)
            }

        }
        .padding(12)
    }

    @ViewBuilder
    func pointView(
        _ part: DisplayPointPart,
        point: Int,
        color: Color
    ) -> some View {
        VStack {
            HStack {
                Text(part.display)
                    .dmsFont(.body(.body2))

                Spacer()
            }
            .padding(8)

            Spacer()

            HStack {
                Spacer()

                Text("\(point)")
                    .dmsFont(.headline(.headline2))
            }
            .padding(8)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(color)
    }
}
