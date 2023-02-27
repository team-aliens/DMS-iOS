import DesignSystem
import Foundation
import SwiftUI
import Utility
import lay

struct ApplyTimeSettingView: View {
    @State var tags: [ApplyTime] = []
    @State var isAppear = false

    var tagDummy = [
        ApplyTime(text: "10시 ~ 11시"),
        ApplyTime(text: "11시 ~ 11시 50분"),
        ApplyTime(text: "10시 ~ 11시"),
        ApplyTime(text: "11시 ~ 11시 50분"),
        ApplyTime(text: "10시 ~ 11시"),
        ApplyTime(text: "11시 ~ 11시 50분")

    ]

    var body: some View {
        VStack {
            HStack {
                Text("시간")
                    .dmsFont(.title(.title2), color: .black)

                Spacer()
            }
            .padding(.top, 40)

            if isAppear {
                ApplyTimeCellView(tags: $tags)
                DMSWideButton(
                    text: "확인",
                    color: .PrimaryVariant.primary
                ) {
                    print("확인.")
                    tags.append(ApplyTime(text: "10시 ~ 11시"))
                }
            }
        }
        .padding(.horizontal, 24)
        .onAppear {
            tagDummy.map { tag in
                tags.append(tag)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation {
                    isAppear = true
                }
            }
        }
    }
}
