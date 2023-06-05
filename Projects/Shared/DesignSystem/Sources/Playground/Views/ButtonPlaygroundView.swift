import SwiftUI

struct ButtonPlaygroundView: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    DMSButton(text: "Contained", color: .PrimaryVariant.primary)

                    DMSButton(text: "Contained", color: .PrimaryVariant.primary)
                        .disabled(true)

                    DMSButton(text: "Outlined", style: .outlined, color: .PrimaryVariant.primary)

                    DMSButton(text: "Outlined", style: .outlined, color: .PrimaryVariant.primary)
                        .disabled(true)

                    DMSButton(text: "Text", style: .text, color: .PrimaryVariant.primary)

                    DMSButton(text: "Text", style: .text, color: .PrimaryVariant.primary)
                        .disabled(true)

                    DMSButton(text: "Underlined", style: .underline, color: .PrimaryVariant.primary)

                    DMSButton(text: "Underlined", style: .underline, color: .PrimaryVariant.primary)
                        .disabled(true)
                }
                .padding(.vertical, 5)
            }
        }
    }
}

struct ButtonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlaygroundView()
    }
}
