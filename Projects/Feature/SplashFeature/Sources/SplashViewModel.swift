import UIKit
import BaseFeature
import AuthDomainInterface
import NotificationDomainInterface
import Firebase
import FirebaseMessaging

final class SplashViewModel: BaseViewModel {
    private let reissueTokenUseCase: any ReissueTokenUseCase
    private let postDeviceTokenUseCase: any PostDeviceTokenUseCase

    public init(
        reissueTokenUseCase: any ReissueTokenUseCase,
        postDeviceTokenUseCase: any PostDeviceTokenUseCase
    ) {
        self.reissueTokenUseCase = reissueTokenUseCase
        self.postDeviceTokenUseCase = postDeviceTokenUseCase
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

        addCancellable(
            postDeviceTokenUseCase.execute(token: Messaging.messaging().fcmToken ?? "dms")
        ) { _ in
            print("FCM TOKEN: " + (Messaging.messaging().fcmToken ?? "dms"))
        } onReceiveError: { error in
            onError(error)
        }
    }
}
