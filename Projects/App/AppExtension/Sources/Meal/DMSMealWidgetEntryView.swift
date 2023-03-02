import DesignSystem
import DomainModule
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
        VStack(spacing: 4) {
            Image(systemName: entry.displayMealPart.systemName)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.PrimaryVariant.primary)

            ForEach(entry.meal.byDisplayMealPart(by: entry.displayMealPart).prefix(4), id: \.self) { meal in
                Text(meal)
                    .dmsFont(.etc(.caption), color: .GrayScale.gray6)
            }

            Text("more...")
                .dmsFont(.etc(.overline), color: .PrimaryVariant.darken1)
        }
        .padding(10)
    }
}

private extension MealEntity {
    func byDisplayMealPart(by part: DisplayMealPart) -> [String] {
        switch part {
        case .breakfast:
            return self.breakfast

        case .lunch:
            return self.lunch

        case .dinner:
            return self.dinner
        }
    }
}
