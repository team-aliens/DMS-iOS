import Combine
import DataMappingModule
import DomainModule
import SwiftUI
import Utility
import WidgetKit

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
        if configuration.displayPoint == .both {
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
        } else {
            let pointsType: PointsType = configuration.displayPoint == .bonus ? .bonus : .minus
            fetchPointListUseCase.execute(type: pointsType)
                .map(\.totalPoint)
                .sink { _ in
                } receiveValue: { point in
                    let bonusPoint = pointsType == .bonus ? point : 0
                    let minusPoint = pointsType == .minus ? point : 0
                    let entry = DMSPointEntry(
                        date: date,
                        displayPointPart: configuration.displayPoint.toDisplayPointPart(),
                        bonusPoint: bonusPoint,
                        minusPoint: minusPoint
                    )
                    completion(entry)
                }
                .store(in: &bag)
        }
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
