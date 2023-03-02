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
        
    }
}
