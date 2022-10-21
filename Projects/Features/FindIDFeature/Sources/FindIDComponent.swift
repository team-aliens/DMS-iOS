import DomainModule
import NeedleFoundation
import SwiftUI

public protocol FindIDDependency: Dependency {
    var findIDUseCase: any FindIDUseCase { get }
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase { get }
}

public final class FindIDComponent: Component<FindIDDependency> {
    public func makeView() -> some View {
        FindIdView(
            viewModel: .init(
                findIDUseCase: self.dependency.findIDUseCase,
                checkSchoolCodeUseCase: self.dependency.checkSchoolCodeUseCase
            )
        )
    }
}
