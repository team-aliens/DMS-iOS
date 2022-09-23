import SwiftUI

public struct DMSFloatingTextField: View {
    var label: String
    var text: Binding<String>
    var helpMessage: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    private var isFloaintg: Bool {
        isFocused || !text.wrappedValue.isEmpty
    }
    private var isErrorOccurred: Bool {
        isError || !helpMessage.isEmpty
    }

    public init(
        _ label: String = "",
        text: Binding<String>,
        helpText: String = "",
        isError: Bool = false,
        errorMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        self.text = text
        self.helpMessage = helpText
        self.isError = isError
        self.errorMessage = errorMessage
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .dmsFont(.text(isFloaintg ? .medium : .extraLarge))
                .foregroundColor(
                    isFocused ?
                        .blue :
                        isErrorOccurred ?
                            .red :
                            .gray
                ) // TODO: 디자인 시스템 - 색상 완료시 색 적용
                .offset(y: isFloaintg ? -40 : isErrorOccurred ? -10 : 0)

            VStack(alignment: .leading, spacing: 10) {
                TextField("", text: text)
                    .dmsFont(.text(.medium), color: .black) // TODO: 디자인 시스템 - 색상 완료시 색 적용
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(
                                isFocused ?
                                    .blue :
                                    isErrorOccurred ?
                                        .red :
                                        .gray
                            ) // TODO: 디자인 시스템 - 색상 완료시 색 적용
                            .frame(height: 1)
                            .offset(y: 7)
                    }
                    .focused($isFocused)
                    .onSubmit(onCommit)

                if isErrorOccurred {
                    Text(isError ? errorMessage : helpMessage)
                        .dmsFont(.text(.extraSmall), color: isError ? .red : .gray) // TODO: 디자인 시스템 - 색상 완료시 색 적용
                        .offset(x: 5)
                }
            }
        }
        .animation(.default, value: isErrorOccurred)
        .animation(.default, value: isFloaintg)
        .animation(.default, value: isFocused)
    }
}

struct DMSFloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        DMSFloatingTextField("Test", text: .constant(""))
    }
}
