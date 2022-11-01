import SwiftUI
import DomainModule

struct SchoolSelectButtonView: View {
    @State var placeholderText = "학교를 선택해 주세요"
    @Binding var schoolList: [SchoolEntity]
    var onCommit: (SchoolEntity) -> Void

    private var textColor: Color {
        placeholderText == "학교를 선택해 주세요" ?
            .GrayScale.gray5 :
            .GrayScale.gray9
    }

    public init(
        schoolList: Binding<[SchoolEntity]>,
        onCommit: @escaping (SchoolEntity) -> Void = {_ in }
    ) {
        _schoolList = schoolList
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .bottom) {
                Text(placeholderText)
                    .dmsFont(.text(.medium), color: textColor)

                Spacer()

                Menu {
                    ForEach(schoolList) { school in
                        Button("\(school.name)", action: {
                            placeholderText = school.name
                            onCommit(school)
                        })
                    }
                    .labelsHidden()
                    .pickerStyle(InlinePickerStyle())
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.GrayScale.gray5)
                        .frame(width: 24, height: 24)
                }
            }
            .overlay(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.GrayScale.gray5)
                    .frame(height: 1)
                    .offset(y: 7)
            }
        }
    }
}
