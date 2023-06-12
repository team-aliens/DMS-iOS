import SwiftUI

public extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        self.background {
            NavigationLink(isActive: binding) {
                DeferView {
                    view
                }
            } label: {
                EmptyView()
            }
            .isDetailLink(isDetailLink)
        }
    }
}

public struct DeferView<Content: View>: View {
    let content: () -> Content

    public init(
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.content = content
    }

    public var body: some View {
        content()
            .onAppear {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            }
    }
}
