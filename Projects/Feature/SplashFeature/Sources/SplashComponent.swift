import Foundation
import SwiftUI
import NeedleFoundation
import AuthDomainInterface
import SplashFeatureInterface
import NotificationDomainInterface

public protocol SplashDependency: Dependency {
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
    var postDeviceTokenUseCase: any PostDeviceTokenUseCase { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                reissueTokenUseCase: dependency.reissueTokenUseCase,
                postDeviceTokenUseCase: dependency.postDeviceTokenUseCase
            )
        )
    }
}
