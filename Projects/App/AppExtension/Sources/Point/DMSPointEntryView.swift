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
                VStack {
                    Text("A")
                }

                VStack {
                    Text("B")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.GrayScale.gray1)
                    .dmsShadow(style: .surface)
            }
        }
    }
}
