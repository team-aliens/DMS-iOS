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

        case .systemMedium:
            MediumMealWidgetView(entry: entry)

        default:
            EmptyView()
        }
    }
}

private struct SmallDMSMealWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSMealProvider.Entry

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: entry.displayMealPart.systemName)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.PrimaryVariant.primary)

            ForEach(entry.meal.byDisplayMealPart(by: entry.displayMealPart).prefix(4), id: \.self) { meal in
                Text(meal)
                    .dmsFont(.etc(.caption), color: colorScheme == .light ? .GrayScale.gray6 : .GrayScale.gray7)
            }

            Text("more...")
                .dmsFont(.etc(.overline), color: .PrimaryVariant.darken1)
        }
        .padding(10)
    }
}

private struct MediumMealWidgetView: View {
    @Environment(\.colorScheme) var colorScheme
    let entry: DMSMealProvider.Entry

    var body: some View {
        HStack(spacing: 30) {
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: entry.displayMealPart.systemName)
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundColor(.PrimaryVariant.primary)

                    Text(entry.displayMealPart.display)
                        .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                }

                Spacer()

                if let calorie = entry.meal.byDisplayMealPart(by: entry.displayMealPart).last,
                   calorie.hasSuffix("Kcal") {
                    Text(calorie)
                        .dmsFont(.etc(.caption), color: .GrayScale.gray5)
                }
            }

            mealContentView()
        }
        .padding(16)
    }

    @ViewBuilder
    func mealContentView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(entry.meal.byDisplayMealPart(by: entry.displayMealPart).prefix(5), id: \.self) { meal in
                    Text(meal)
                        .dmsFont(.etc(.caption), color: colorScheme == .light ? .GrayScale.gray6 : .GrayScale.gray7)
                        .frame(maxHeight: .infinity)
                }
            }

            Spacer()
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
