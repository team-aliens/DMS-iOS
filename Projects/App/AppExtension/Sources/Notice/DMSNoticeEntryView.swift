import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct DMSNoticeEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily

    let entry: DMSNoticeProvider.Entry

    init(entry: DMSNoticeProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        widgetBody()
    }

    @ViewBuilder
    func widgetBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            SmallDMSNoticeWidgetView(entry: entry)

        case .systemMedium:
            MediumDMSNoticeWidgetView(entry: entry)

        default:
            EmptyView()
        }
    }
}

private struct SmallDMSNoticeWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSNoticeProvider.Entry

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "megaphone")
                .resizable()
                .frame(width: 13, height: 12)
                .foregroundColor(.PrimaryVariant.primary)

            Text(entry.notice.title)
                .dmsFont(.etc(.caption), color: colorScheme == .light ? .GrayScale.gray6 : .GrayScale.gray7)
                .fixedSize(horizontal: false, vertical: true)

            Text("more...")
                .dmsFont(.etc(.overline), color: .PrimaryVariant.darken1)
        }
        .padding(10)
    }
}

private struct MediumDMSNoticeWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSNoticeProvider.Entry

    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "megaphone")
                    .resizable()
                    .frame(width: 13, height: 12)
                    .foregroundColor(.PrimaryVariant.primary)

                Text("공지")
                    .dmsFont(.etc(.button), color: .PrimaryVariant.primary)

                Spacer()

                let createdAt = entry.notice.createdAt
                let createdAtString = "\(createdAt.year)/\(createdAt.month)/\(createdAt.day)"
                Text(createdAtString)
                    .dmsFont(.etc(.caption), color: .GrayScale.gray5)
            }

            VStack {
                Text(entry.notice.title)
                    .lineSpacing(12)
                    .dmsFont(.etc(.caption), color: colorScheme == .light ? .GrayScale.gray6 : .GrayScale.gray7)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.GrayScale.gray1)
                    .dmsShadow(style: .surface)
            }
        }
        .padding(16)
    }
}
