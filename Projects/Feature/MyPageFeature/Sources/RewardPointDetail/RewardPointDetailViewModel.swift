import PointsDomainInterface

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

    func pointsTypeChanged(type: PointsType) {
        pointsType = type
        fetchPointList()
    }

    func fetchPointList() {
        addCancellable(
            self.fetchPointListUseCase.execute(
                type: pointsType
            )
        ) { [weak self] point in
            self?.point = point
        }
    }
}
