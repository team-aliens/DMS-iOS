import Combine
import BaseFeature
import RemainsDomainInterface
import StudyRoomsDomainInterface

final class ApplyPageViewModel: BaseViewModel {
    @Published var isNavigateToStudy: Bool = false
    @Published var isNavigateToRemain: Bool = false

    @Published var myRemainApplicationItem: MyRemainApplicationItemsEntity?
    @Published var myStudyRoomApplicationItems: MyStudyRoomAppItemsEntity?

    private let fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase
    private let fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase

    var remainState: String? {
        if let item = myRemainApplicationItem {
            return item.title
        } else {
            return nil
        }
    }

    var studyRoomState: String? {
        if let item = myStudyRoomApplicationItems {
            return String(item.floor) + "층 " + item.name
        } else {
            return nil
        }
    }

    public init(
        fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase,
        fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase
    ) {
        self.fetchMyRemainApplicationItemsUseCase = fetchMyRemainApplicationItemsUseCase
        self.fetchMyStudyRoomAppItemsUseCase = fetchMyStudyRoomAppItemsUseCase
    }

    func fetchMyRemainApplicationItems() {
        addCancellable(
            fetchMyRemainApplicationItemsUseCase.execute()
        ) { [weak self] myRemainApplicationItem in
            self?.myRemainApplicationItem = myRemainApplicationItem
        } onReceiveError: { [weak self] _ in
            self?.myRemainApplicationItem = nil
        }
    }

    func fetchMyStudyRoomApplicationItems() {
        addCancellable(
            fetchMyStudyRoomAppItemsUseCase.execute()
        ) { [weak self] myStudyRoomApplicationItems in
            self?.myStudyRoomApplicationItems = myStudyRoomApplicationItems
        } onReceiveError: { [weak self] _ in
            self?.myStudyRoomApplicationItems = nil
        }
    }

    func onAppear() {
        fetchMyRemainApplicationItems()
        fetchMyStudyRoomApplicationItems()
    }

    func refresh() {
        fetchMyRemainApplicationItems()
        fetchMyStudyRoomApplicationItems()
    }
}
