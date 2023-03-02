import DomainModule
import SwiftUI
import Utility
import WidgetKit

struct DMSMealWidget: Widget {
    let kind: String = "DMSMealWidget"
    let provider: DMSMealProvider

    init() { fatalError() }

    init(provider: DMSMealProvider) {
        self.provider = provider
    }

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: provider
        ) { entry in
            DMSMealWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("DMS 급식")
        .description("DMS의 위젯을 통해 급식을 확인해보세요!")
    }
}

struct DMSMealProvider: TimelineProvider {
    typealias Entry = DMSMealEntry

    func placeholder(in context: Context) -> DMSMealEntry {
        .placeholder()
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (DMSMealEntry) -> Void
    ) {
        
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<DMSMealEntry>) -> Void
    ) {
        
    }
}

struct DMSMealEntry: TimelineEntry {
    let date: Date
    let meal: MealEntity

    static func placeholder() -> DMSMealEntry {
        DMSMealEntry(
            date: Date(),
            meal: .init(
                date: Date().toDMSDateString(),
                breakfast: [],
                lunch: [],
                dinner: []
            )
        )
    }
}
