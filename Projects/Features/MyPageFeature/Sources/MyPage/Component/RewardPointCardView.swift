import SwiftUI
import DesignSystem

enum RewardPointType {
    case bonusPoint
    case minusPoint
}

struct RewardPointCardView: View {
    let title: String
    let point: Int
    let rewardType: RewardPointType

    var textColor: Color {
        rewardType == .bonusPoint ? .PrimaryVariant.darken2 : .ErrorVariant.darken2
    }

    var containerColor: Color {
        rewardType == .bonusPoint ? .System.primaryContainer : .System.errorContainer
    }
    var body: some View {
        ZStack {
            containerColor

            VStack {
                HStack {
                    Text(title)
                        .dmsFont(.body(.body3), color: textColor)

                    Spacer()
                }
                .padding(.top, 16)

                HStack {
                    Spacer()

                    Text("\(point)")
                        .dmsFont(.headline(.headline2), color: textColor)
                }
                .padding(.bottom, 16)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 95)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(textColor, lineWidth: 1)
                    .dmsShadow()
            }
        }
    }
}
