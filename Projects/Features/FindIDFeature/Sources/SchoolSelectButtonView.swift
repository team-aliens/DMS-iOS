import SwiftUI

struct SchoolSelectButtonView: View {
    @State var selectedColor = "학교를 선택해 주세요"
    @Binding var schoolList: [String]

    private var textColor: Color {
        selectedColor == "학교를 선택해 주세요" ?
            .GrayScale.gray5 :
            .GrayScale.gray9
    }

    public init(schoolList: Binding<[String]>) {
        _schoolList = schoolList
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .bottom) {
                Text(selectedColor)
                    .dmsFont(.text(.medium), color: textColor)
                Spacer()
                Menu {
                    Picker("", selection: $selectedColor) {
                        ForEach(schoolList, id: \.self) {
                            Text($0)
                        }
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
