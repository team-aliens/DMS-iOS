import NeedleFoundation
import SwiftUI
import HomeFeatureInterface
import ApplyFeatureInterface
import NoticeFeatureInterface
import MyPageFeatureInterface
import MainTabFeatureInterface

public protocol MainTabDependency: Dependency {
    var homeFactory: any HomeFactory { get }
    var applyPageFactory: any ApplyPageFactory { get }
    var noticeListFactory: any NoticeListFactory { get }
    var myPageFactory: any MyPageFactory { get }
}

public final class MainTabComponent: Component<MainTabDependency>, MainTabFactory {
    public func makeView() -> some View {
        MainTabView(
            homeFactory: dependency.homeFactory,
            applyPageFactory: dependency.applyPageFactory,
            noticeFactory: dependency.noticeListFactory,
            myPageFactory: dependency.myPageFactory
        )
    }
}
