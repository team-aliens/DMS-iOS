import Combine
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
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

final class DMSMealProvider: TimelineProvider {
    private let fetchMealListUseCase: any FetchMealListUseCase
    private var bag = Set<AnyCancellable>()

    init(fetchMealListUseCase: any FetchMealListUseCase) {
        self.fetchMealListUseCase = fetchMealListUseCase
    }

    typealias Entry = DMSMealEntry

    func placeholder(in context: Context) -> DMSMealEntry {
        .placeholder()
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (DMSMealEntry) -> Void
    ) {
        let date = Date()
        let displayPart = DisplayMealPart(date: date)
        fetchMealListUseCase.execute(date: date.toSmallDMSDateString())
            .map { $0.filter { $0.date == date.toSmallDMSDateString() }.first }
            .sink { _ in
            } receiveValue: { mealEntity in
                if let mealEntity {
                    let entry = DMSMealEntry(
                        date: date,
                        meal: mealEntity,
                        displayMealPart: displayPart
                    )
                    completion(entry)
                } else {
                    let entry = DMSMealEntry.placeholder(date: date)
                    completion(entry)
                }
            }
            .store(in: &bag)
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<DMSMealEntry>) -> Void
    ) {
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? .init()
        let date = Date()
        let displayPart = DisplayMealPart(date: date)
        fetchMealListUseCase.execute(date: date.toSmallDMSDateString())
            .map { $0.filter { $0.date == date.toSmallDMSDateString() }.first }
            .sink { _ in
            } receiveValue: { mealEntity in
                if let mealEntity {
                    let entry = DMSMealEntry(
                        date: date,
                        meal: mealEntity,
                        displayMealPart: displayPart
                    )
                    completion(.init(entries: [entry], policy: .after(nextUpdate)))
                } else {
                    let entry = DMSMealEntry.placeholder(date: date)
                    completion(.init(entries: [entry], policy: .after(nextUpdate)))
                }
            }
            .store(in: &bag)
    }
}

struct DMSMealEntry: TimelineEntry {
    let date: Date
    let meal: MealEntity
    let displayMealPart: DisplayMealPart

    static func placeholder(date: Date = Date()) -> DMSMealEntry {
        DMSMealEntry(
            date: date,
            meal: MealEntity(
                date: date.toDMSDateString(),
                breakfast: [],
                lunch: [],
                dinner: []
            ),
            displayMealPart: .breakfast
        )
    }
}
