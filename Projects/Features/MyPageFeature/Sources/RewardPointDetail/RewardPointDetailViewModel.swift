import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class RewardPointDetailViewModel: BaseViewModel {
    @Published var pointList: PointEntity?

    private let fetchPointListUseCase: any FetchPointListUseCase

    init(
        fetchPointListUseCase: any FetchPointListUseCase
    ) {
        self.fetchPointListUseCase = fetchPointListUseCase
        super.init()
        fetchPointList()
    }

    func fetchPointList() {
        
    }
}
