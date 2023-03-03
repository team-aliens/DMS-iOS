import Combine
import DomainModule
import SwiftUI
import Utility
import WidgetKit

final class DMSPointProvider: TimelineProvider {
    private let fetchPointListUseCase: any FetchPointListUseCase
    private var bag = Set<AnyCancellable>()

    init(fetchPointListUseCase: any FetchPointListUseCase) {
        self.fetchPointListUseCase = fetchPointListUseCase
    }

    typealias Entry = DMSPointEntry

    func placeholder(in context: Context) -> DMSPointEntry {
        .placeholder()
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (DMSPointEntry) -> Void
    ) {

    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<DMSPointEntry>) -> Void
    ) {

    }
}

struct DMSPointEntry: TimelineEntry {
    let date: Date
    let displayPointPart: DisplayPointPart
    let point: PointEntity

    static func placeholder() -> DMSPointEntry {
        DMSPointEntry(
            date: Date(),
            displayPointPart: .both,
            point: PointEntity(
                totalPoint: 10,
                poinsts: []
            )
        )
    }
}
