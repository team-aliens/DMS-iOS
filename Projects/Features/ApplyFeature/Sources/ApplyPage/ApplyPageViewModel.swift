import BaseFeature
import DomainModule
import DataMappingModule
import Combine
import SwiftUI

final class ApplyPageViewModel: BaseViewModel {
    @Published var isNavigateToStudy: Bool = false
    @Published var isNavigateToRemain: Bool = false

    @Published var myRemainApplicationItem: MyRemainApplicationItemsEntity?
    @Published var myStudyRoomApplicationItems: MyStudyRoomAppItemsEntity?

//    private let fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase
//    private let fehtchMyStudyRoomAppItemsUserCase: any FetchMyStudyRoomAppItemsUserCase

    var remainState: String? {
        if let item = myRemainApplicationItem {
            return item.title
        } else {
            return nil
        }
    }

    var studyRoomState: String? {
        if let item = myStudyRoomApplicationItems {
            return item.floor + "층 " + item.name
        } else {
            return nil
        }
    }
//
//    public init(
//        fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase,
//        fehtchMyStudyRoomAppItemsUserCase: any FetchMyStudyRoomAppItemsUserCase
//    ) {
//        self.fetchMyRemainApplicationItemsUseCase = fetchMyRemainApplicationItemsUseCase
//        self.fehtchMyStudyRoomAppItemsUserCase = fehtchMyStudyRoomAppItemsUserCase
//    }

//    func fetchMyRemainApplicationItems() {
//        addCancellable(
//            fetchMyRemainApplicationItemsUseCase.execute()
//        ) { [weak self] myRemainApplicationItem in
//            self?.myRemainApplicationItem = myRemainApplicationItem
//        }
//    }
//
//    func fehtchMyStudyRoomApplicationItems() {
//        addCancellable(
//            fehtchMyStudyRoomAppItemsUserCase.execute()
//        ) { [weak self] myStudyRoomApplicationItems in
//            self?.myStudyRoomApplicationItems = myStudyRoomApplicationItems
//        }
//    }
}
