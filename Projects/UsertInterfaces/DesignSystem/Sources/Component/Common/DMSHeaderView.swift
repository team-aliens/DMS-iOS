import SwiftUI

public struct DMSHeaderView: View {
    private let subTitle: String

    public init(subTitle: String) {
        self.subTitle = subTitle
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("DMS")
                    .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                Text(subTitle)
                    .dmsFont(.text(.medium), color: .GrayScale.gray6)
            }

            Spacer()
        }
    }
}
