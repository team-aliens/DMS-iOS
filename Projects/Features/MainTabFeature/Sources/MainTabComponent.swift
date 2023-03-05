import NeedleFoundation
import SwiftUI
import HomeFeature
import ApplyFeature
import NoticeFeature
import MyPageFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
    var applyPageComponent: ApplyPageComponent { get }
    var noticeListComponent: NoticeListComponent { get }
    var myPageComponent: MyPageComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent,
            applyPageComponent: dependency.applyPageComponent,
            noticeComponent: dependency.noticeListComponent,
            myPageComponent: dependency.myPageComponent
        )
    }
}
