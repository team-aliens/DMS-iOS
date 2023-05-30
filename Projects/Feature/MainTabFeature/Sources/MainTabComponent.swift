import NeedleFoundation
import SwiftUI
import HomeFeatureInterface
import ApplyFeatureInterface
import NoticeFeatureInterface
import MyPageFeatureInterface
import MainTabFeatureInterface

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
    var applyPageComponent: ApplyPageComponent { get }
    var noticeListComponent: NoticeListComponent { get }
    var myPageComponent: MyPageComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency>, MainTabFactory {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent,
            applyPageComponent: dependency.applyPageComponent,
            noticeComponent: dependency.noticeListComponent,
            myPageComponent: dependency.myPageComponent
        )
    }
}
