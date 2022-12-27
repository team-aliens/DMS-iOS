import SwiftUI
import NeedleFoundation
import DomainModule

public protocol SplashDependency: Dependency {
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
}

public final class SplashComponent: Component<SplashDependency> {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                reissueTokenUseCase: dependency.reissueTokenUseCase
            )
        )
    }
}
