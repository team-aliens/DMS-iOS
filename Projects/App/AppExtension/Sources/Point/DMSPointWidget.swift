import Combine
import DataMappingModule
import DomainModule
import SwiftUI
import Utility
import WidgetKit

struct DMSPointWidget: Widget {
    let kind: String = "DMSPointWidget"
    let provider: DMSPointProvider

    init() { fatalError() }

    init(provider: DMSPointProvider) {
        self.provider = provider
    }

    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: DMSPointIntent.self,
            provider: provider
        ) { entry in
            DMSPointEntryView(entry: entry)
                .widgetURL(URL(string: "widget://deeplink?text=point"))
        }
        .configurationDisplayName("DMS 상벌점")
        .description("DMS의 위젯을 통해 상벌점를 확인해보세요!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

final class DMSPointProvider: IntentTimelineProvider {
    private let fetchPointListUseCase: any FetchPointListUseCase
    private var bag = Set<AnyCancellable>()

    init(fetchPointListUseCase: any FetchPointListUseCase) {
        self.fetchPointListUseCase = fetchPointListUseCase
    }

    typealias Intent = DMSPointIntent
    typealias Entry = DMSPointEntry

    func placeholder(in context: Context) -> DMSPointEntry {
        .placeholder()
    }

    func getSnapshot(
        for configuration: Intent,
        in context: Context,
        completion: @escaping (DMSPointEntry) -> Void
    ) {
        let date = Date()
        entryCompletion(date: date, configuration: configuration, completion: completion)
    }

    func getTimeline(
        for configuration: Intent,
        in context: Context,
        completion: @escaping (Timeline<DMSPointEntry>) -> Void
    ) {
        let date = Date()
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? .init()

        entryCompletion(date: date, configuration: configuration) { entry in
            completion(.init(entries: [entry], policy: .after(nextUpdate)))
        }
    }

    func entryCompletion(
        date: Date,
        configuration: Intent,
        completion: @escaping (DMSPointEntry) -> Void
    ) {
        Publishers.Zip(
            fetchPointListUseCase.execute(type: .bonus),
            fetchPointListUseCase.execute(type: .minus)
        )
        .map { ($0.0.totalPoint, $0.1.totalPoint) }
        .sink { _ in
        } receiveValue: { (bonus, minus) in
            let entry = DMSPointEntry(
                date: date,
                displayPointPart: configuration.displayPoint.toDisplayPointPart(),
                bonusPoint: bonus,
                minusPoint: minus
            )
            completion(entry)
        }
        .store(in: &bag)
    }
}

struct DMSPointEntry: TimelineEntry {
    let date: Date
    let displayPointPart: DisplayPointPart
    let bonusPoint: Int
    let minusPoint: Int

    static func placeholder() -> DMSPointEntry {
        DMSPointEntry(
            date: Date(),
            displayPointPart: .both,
            bonusPoint: 0,
            minusPoint: 0
        )
    }
}

private extension DisplayPoint {
    func toDisplayPointPart() -> DisplayPointPart {
        switch self {
        case .both:
            return .both

        case .bonus:
            return .bonus

        case .minus:
            return .minus

        default:
            return .both
        }
    }
}
