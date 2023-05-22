import SwiftUI

public struct DMSHeaderTitleView: View {
    private let subTitle: String

    public init(subTitle: String) {
        self.subTitle = subTitle
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                DMSImage(.logoHorizontal)
                    .frame(width: 124, height: 44)

                Text(subTitle)
                    .dmsFont(.body(.body2), color: .GrayScale.gray6)
            }

            Spacer()
        }
    }
}
