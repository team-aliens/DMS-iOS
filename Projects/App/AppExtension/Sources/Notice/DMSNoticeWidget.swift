import Combine
import DomainModule
import SwiftUI
import Utility
import WidgetKit

struct DMSNoticeWidget: Widget {
    let kind: String = "DMSNoticeWidget"
    let provider: DMSNoticeProvider

    init() { fatalError() }

    init(provider: DMSNoticeProvider) {
        self.provider = provider
    }

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: provider
        ) { entry in
            DMSNoticeEntryView(entry: entry)
                .widgetURL(URL(string: "widget://deeplink?text=notice"))
        }
        .configurationDisplayName("DMS 공지")
        .description("DMS의 위젯을 통해 공지를 확인해보세요!")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

final class DMSNoticeProvider: TimelineProvider {
    private let fetchNoticeListUseCase: any FetchNoticeListUseCase
    private var bag = Set<AnyCancellable>()

    init(fetchNoticeListUseCase: any FetchNoticeListUseCase) {
        self.fetchNoticeListUseCase = fetchNoticeListUseCase
    }

    typealias Entry = DMSNoticeEntry

    func placeholder(in context: Context) -> DMSNoticeEntry {
        .placeholder()
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (DMSNoticeEntry) -> Void
    ) {
        let date = Date()
        fetchNoticeListUseCase.execute(order: .new)
            .map { $0.first }
            .replaceNil(with: NoticeEntity(id: UUID().uuidString, title: "최신 공지가 없음", createdAt: date))
            .sink { _ in
            } receiveValue: { noticeEntity in
                let entry = DMSNoticeEntry(
                    date: date,
                    notice: noticeEntity
                )
                completion(entry)
            }
            .store(in: &bag)
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<DMSNoticeEntry>) -> Void
    ) {
        let date = Date()
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? .init()
        fetchNoticeListUseCase.execute(order: .new)
            .map { $0.first }
            .replaceNil(with: NoticeEntity(id: UUID().uuidString, title: "최신 공지가 없음", createdAt: date))
            .sink { _ in
            } receiveValue: { noticeEntity in
                let entry = DMSNoticeEntry(
                    date: date,
                    notice: noticeEntity
                )
                completion(.init(entries: [entry], policy: .after(nextUpdate)))
            }
            .store(in: &bag)
    }
}

struct DMSNoticeEntry: TimelineEntry {
    let date: Date
    let notice: NoticeEntity

    static func placeholder() -> DMSNoticeEntry {
        DMSNoticeEntry(
            date: Date(),
            notice: .init(
                id: UUID().uuidString,
                title: "아아, 이것은 ⌜공지⌟라는 것이다.",
                createdAt: Date().addingTimeInterval(-19900)
            )
        )
    }
}
