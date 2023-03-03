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
            Group {
                HStack(alignment: .center) {
                    VStack {
                        Text("상점")
                            .dmsFont(.etc(.caption), color: .PrimaryVariant.primary)

                        Spacer()
                    }

                    Spacer()

                    Text("\(entry.bonusPoint)")
                        .dmsFont(.headline(.headline3), color: .PrimaryVariant.primary)
                }
                .padding(.top, 10)

                HStack(alignment: .center) {
                    VStack {
                        Text("벌점")
                            .dmsFont(.etc(.caption), color: .ErrorVariant.darken1)

                        Spacer()
                    }

                    Spacer()

                    Text("\(entry.minusPoint)")
                        .dmsFont(.headline(.headline3), color: .ErrorVariant.darken1)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.GrayScale.gray1)
                    .dmsShadow(style: .surface)
            }
        }
        .padding(12)
    }
}
