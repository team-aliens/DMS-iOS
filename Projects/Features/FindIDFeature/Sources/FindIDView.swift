import SwiftUI
import DesignSystem

public struct FindIdView: View {

    @StateObject var viewModel: FIndIDViewModel

    public var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)
                        .padding(.top, 28)

                    Text("더 편한 기숙사 생활을 위해")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }
                Spacer()
            }
        }
    }
}
