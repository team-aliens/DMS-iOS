import BaseFeature
import Combine
import DomainModule

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    func onAppear(
        receiveData: @escaping (DmsFeatures) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(reissueTokenUseCase.execute()) { features in
            receiveData(features)
        } onReceiveError: { error in
            onError(error)
        }
    }
}
