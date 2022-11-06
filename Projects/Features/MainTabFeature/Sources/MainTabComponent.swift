import NeedleFoundation
import SwiftUI
import HomeFeature
import ApplyFeature
import NoticeFeature
import MyPageFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
    var applyComponent: ApplyComponent { get }
    var noticeComponent: NoticeListComponent { get }
    var myPageComponent: MyPageComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent,
            applyComponent: dependency.applyComponent,
            noticeComponent: dependency.noticeComponent,
            myPageComponent: dependency.myPageComponent
        )
    }
}
