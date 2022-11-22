import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule
import DesignSystem

final class RewardPointDetailViewModel: BaseViewModel {
    @Published var point: PointEntity?
    @Published var pointsType: PointsType = .all

    private let fetchPointListUseCase: any FetchPointListUseCase

    init(
        fetchPointListUseCase: any FetchPointListUseCase
    ) {
        self.fetchPointListUseCase = fetchPointListUseCase
        super.init()
        fetchPointList()
    }

    func fetchPointList() {
        addCancellable(
            self.fetchPointListUseCase.execute(
                type: pointsType
            )) { [weak self] point in
                self?.point = point
            }
    }

    func pointTypeButtonDidTap(type: PointsType) {
        if PointsType.bonus == true {
            DMSButton(color: PrimaryColor.lighten1)
        }
        fetchPointList()
    }
}
