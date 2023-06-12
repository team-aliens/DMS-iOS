import BaseFeature
import AuthDomainInterface

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    func onAppear(
        receiveData: @escaping (SigninDmsFeatures) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(reissueTokenUseCase.execute()) { features in
            receiveData(features)
        } onReceiveError: { error in
            onError(error)
        }
    }
}
