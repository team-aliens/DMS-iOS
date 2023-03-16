import Foundation
import DesignSystem
import SwiftUI

struct StudyroomTimeListView: View {
    @State var isClicked: Bool = false
    let okButtonAction: () -> Void
    public init(
        isClicked: Bool,
        okButtonAction: @escaping () -> Void
    ) {
        self.isClicked = isClicked
        self.okButtonAction = okButtonAction
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 37) {
            Text("시간")
                .dmsFont(.title(.subTitle1), color: .GrayScale.gray10)
                .frame(height: 28)
                .padding(.top, 40)
                .padding(.leading, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        Button {
                            isClicked.toggle()
                        } label: {
                            Text("10시 ~ 11시")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                                .dmsFont(
                                    .etc(.button),
                                    color: isClicked ? .GrayScale.gray1 : .GrayScale.gray4
                                )
                                .background {
                                    isClicked ? Color.PrimaryVariant.primary : Color.GrayScale.gray1
                                }
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .inset(by: 1)
                                .stroke(
                                    isClicked ? Color.System.primary : Color.GrayScale.gray4,
                                    lineWidth: 2
                                )
                        )
                        .cornerRadius(5)
                        .padding(.horizontal, 5)
                    }
                }
            }
            .padding(.horizontal, 19)
            .padding(.bottom, 10)

            DMSWideButton(
                text: "확인",
                style: .contained,
                color: .PrimaryVariant.primary,
                action: {
                    okButtonAction()
                }
            )
            .padding(.horizontal, 24)
            .padding(.bottom)
        }
    }
}
