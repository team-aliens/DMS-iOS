import SwiftUI

public struct DMSFloatingTextField: View {
    var label: String
    @Binding var text: String
    var helpMessage: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool
    private var isFloaintg: Bool {
        isFocused || !text.isEmpty
    }
    private var isErrorOrHelpNotEmpty: Bool {
        isError || !helpMessage.isEmpty
    }
    private var dmsForegroundColor: Color {
        isFocused ?
            .PrimaryVariant.darken2 :
            isError ?
                .System.error :
                .GrayScale.gray5
    }

    public init(
        _ label: String = "",
        text: Binding<String>,
        helpMessage: String = "",
        isError: Bool = false,
        errorMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        _text = text
        self.helpMessage = helpMessage
        self.isError = isError
        self.errorMessage = errorMessage
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(label)
                .dmsFont(.text(.extraLarge), color: dmsForegroundColor)
                .offset(y: isFloaintg ? -40 : isErrorOrHelpNotEmpty ? -10 : 0)
                .scaleEffect(isFloaintg ? 0.8 : 1, anchor: .topLeading)

            VStack(alignment: .leading, spacing: 10) {
                TextField("", text: $text)
                    .dmsFont(.text(.medium), color: .GrayScale.gray9)
                    .foregroundColor(dmsForegroundColor)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(dmsForegroundColor)
                            .frame(height: 1)
                            .offset(y: 7)
                    }
                    .focused($isFocused)
                    .onSubmit(onCommit)

                if !isError && !helpMessage.isEmpty {
                    Text(helpMessage)
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                        .offset(x: 5)
                } else if isError && !errorMessage.isEmpty {
                    Text(errorMessage)
                        .dmsFont(.text(.extraSmall), color: .System.error)
                        .offset(x: 5)
                }
            }
        }
        .animation(.easeIn(duration: 0.3), value: isErrorOrHelpNotEmpty)
        .animation(.easeIn(duration: 0.3), value: isFloaintg)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}

struct DMSFloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        DMSFloatingTextField("Test", text: .constant(""))
    }
}
