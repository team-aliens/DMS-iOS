import DesignSystem
import SwiftUI

struct DMSMealWidgetEntryView: View {
    @Environment(\.widgetFamily) var widgetFamily

    let entry: DMSMealProvider.Entry

    init(entry: DMSMealProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        widgetBody()
    }

    @ViewBuilder
    func widgetBody() -> some View {
        switch widgetFamily {
        case .systemSmall:
            SmallDMSMealWidgetView(entry: entry)

        default:
            EmptyView()
        }
    }
}

private struct SmallDMSMealWidgetView: View {
    let entry: DMSMealProvider.Entry

    var body: some View {
        EmptyView()
    }
}
