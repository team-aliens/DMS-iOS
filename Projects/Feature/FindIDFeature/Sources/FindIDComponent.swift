import SchoolDomainInterface
import StudentsDomainInterface
import NeedleFoundation
import SwiftUI
import FindIDFeatureInterface

public protocol FindIDDependency: Dependency {
    var findIDUseCase: any FindIDUseCase { get }
    var fetchSchoolListUseCase: any FetchSchoolListUseCase { get }
}

public final class FindIDComponent: Component<FindIDDependency>, FindIDFactory {
    public func makeView() -> some View {
        FindIDView(
            viewModel: .init(
                findIDUseCase: self.dependency.findIDUseCase,
                fetchSchoolListUseCase: self.dependency.fetchSchoolListUseCase
            )
        )
    }
}
