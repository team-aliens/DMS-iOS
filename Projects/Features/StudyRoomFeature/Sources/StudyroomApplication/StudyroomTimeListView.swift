import Foundation
import DesignSystem
import SwiftUI

struct StudyroomTimeListView: View {
    @State var isClicked: Bool = false
    var body: some View {
        VStack {
            Text("시간")
                .dmsFont(.title(.subTitle1), color: .GrayScale.gray10)
                .frame(height: 28)
                .padding(.top, 40)
                .padding(.leading, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(0..<5) { _ in
                    Button {
                        isClicked.toggle()
                    } label: {
                        Text("10시 ~ 11시")
                            .dmsFont(.etc(.button), color: <#T##Color#>)
                    }
                }
            }
        }
        .frame(width: .infinity, height: .infinity)
        .background(
            Color.GrayScale.gray1
        )
    }
}
