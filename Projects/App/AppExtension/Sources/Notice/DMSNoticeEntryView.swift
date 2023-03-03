import DesignSystem
import DomainModule
import SwiftUI

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
                .fixedSize()

            Text("more...")
                .dmsFont(.etc(.overline), color: .PrimaryVariant.darken1)
        }
        .padding(10)
    }
}
