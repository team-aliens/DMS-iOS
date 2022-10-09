import SwiftUI

public struct DeisgnSystemPlaygroundView: View {
    let list: [(String, AnyView)] = [
        ("Color", AnyView(ColorPlaygroundView())),
        ("Text", AnyView(FontPlaygroundView())),
        ("Button", AnyView(ButtonPlaygroundView())),
        ("Switch", AnyView(SwitchPlaygroundView())),
        ("Checkbox", AnyView(CheckboxPlaygroundView())),
        ("TextField", AnyView(TextFieldPlaygroundView()))
    ]

    public init() {}

    public var body: some View {
        NavigationView {
            List(list, id: \.0) { item in
                NavigationLink {
                    item.1
                } label: {
                    Text(item.0)
                }
            }
            .navigationTitle("DesignSystem")
        }
    }
}

struct DeisgnSystemPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        DeisgnSystemPlaygroundView()
    }
}
