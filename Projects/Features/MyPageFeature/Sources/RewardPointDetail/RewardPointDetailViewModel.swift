import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class RewardPointDetailViewModel: BaseViewModel {
    @Published var pointList: [PointEntity] = []

    private let fetchPointsUseCase: any fetchPointsUseCase

    init(
        fetchPointsUseCase: any FetchPointsUseCase
    ) {
        self.fetchPointsUseCase = fetchPointsUseCase
        super.init()
        fetchPointList()
    }

    func fetchPointList() {
        addCancellable(
            fetchPointsUseCase.execute(
            )
        ) { [weak self]  pointList in
//            self?.pointList = pointList
        }
    }
}
