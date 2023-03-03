import DomainModule
import NeedleFoundation

protocol DMSNoticeDependency: Dependency {
    var fetchNoticeListUseCase: any FetchNoticeListUseCase { get }
}

final class DMSNoticeComponent: Component<DMSNoticeDependency> {

}
