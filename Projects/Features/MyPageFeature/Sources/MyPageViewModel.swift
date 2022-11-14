import BaseFeature
import Combine
import DomainModule

final class MyPageViewModel: BaseViewModel {
    @Published var profile: MyProfileEntity?

    private let fetchMyProfileUseCase: any FetchMyProfileUseCase

    public init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
    }

    func onAppear() {
        addCancellable(
            fetchMyProfileUseCase.execute()
        ) { [weak self] profile in
            self?.profile = profile
        }
    }
}
