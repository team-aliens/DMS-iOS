import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class RewardPointDetailViewModel: BaseViewModel {
    @Published var pointList: [PointEntity] = []

    private let fetchMyProfileUseCase: any FetchMyProfileUseCase

    init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        super.init()
        fetchPointList()
    }

    func fetchPointList() {
        addCancellable(
            fetchMyProfileUseCase.execute(
            )
        ) { [weak self]  pointList in
//            self?.pointList = pointList
        }
    }
}
