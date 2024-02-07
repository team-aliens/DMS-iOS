import DesignSystem
import SwiftUI

struct OutingApplyContentView: View {
    let date: String
    let type: String
    let isAccepted: Bool
    let startTime: String
    let endTime: String
    let people: String
    let place: String
    let reason: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                Text(date)
                    .dmsFont(.body(.body3), color: .PrimaryVariant.primary)
                    .padding(.top, 3)
                    .padding(.bottom, 8)

                Text(type)
                    .dmsFont(.title(.title3), color: .GrayScale.gray10)

                Text("\(startTime) ~ \(endTime)")
                    .dmsFont(.body(.body2), color: .GrayScale.gray6)
                    .padding(.bottom, 26)

                HStack {
                    Text("동행자 : ")
                        .dmsFont(.etc(.button), color: .GrayScale.gray7)

                    Text(people)
                        .dmsFont(.body(.body3), color: .GrayScale.gray7)
                }

                HStack {
                    Text("외출 장소 : ")
                        .dmsFont(.etc(.button), color: .GrayScale.gray7)

                    Text(place)
                        .dmsFont(.body(.body3), color: .GrayScale.gray7)
                }

                Text(reason)
                    .dmsFont(.body(.body3), color: .GrayScale.gray6)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .background(Color.GrayScale.gray2)
                    .cornerRadius(10)
            }

            if isAccepted {
                Text("수락됨")
                    .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.PrimaryVariant.lighten2)
                    .cornerRadius(24)
            }
        }
        .padding(.all, 20)
        .background(Color.GrayScale.gray1)
        .cornerRadius(10)
        .dmsShadow(style: .surface)
        .padding(.horizontal, 20)
    }
}
