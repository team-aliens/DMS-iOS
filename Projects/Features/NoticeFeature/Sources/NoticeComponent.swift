import SwiftUI
import NeedleFoundation

public protocol NoticeDependency: Dependency {}

public final class NoticeComponent: Component<NoticeDependency> {
    public func makeView() -> some View {
        Text("Text")
    }
}

