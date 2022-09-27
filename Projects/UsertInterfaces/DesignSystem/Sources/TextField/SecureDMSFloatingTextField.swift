import SwiftUI

public struct SecureDMSFloatingTextField: View {
    var label: String
    @Binding var text: String
    var helpMessage: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @State var isSecure = true
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
            HStack {
                Text(label)
                    .dmsFont(.text(isFloaintg ? .medium : .extraLarge), color: dmsForegroundColor)
                    .offset(y: isFloaintg ? -40 : isErrorOrHelpNotEmpty ? -10 : 0)
                    .onTapGesture {
                        isFocused = true
                    }

                Spacer()

                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.GrayScale.gray5)
                }
                .padding()
                .offset(y: isErrorOrHelpNotEmpty ? -10 : 0)
            }
            .zIndex(1)

            VStack(alignment: .leading, spacing: 10) {
                Group {
                    if isSecure {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                    }
                }
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

                if isErrorOrHelpNotEmpty {
                    Text(isError ? errorMessage : helpMessage)
                        .dmsFont(.text(.extraSmall), color: isError ? .System.error : .GrayScale.gray5)
                        .offset(x: 5)
                }
            }
        }
        .animation(.easeIn(duration: 0.3), value: isErrorOrHelpNotEmpty)
        .animation(.easeIn(duration: 0.3), value: isFloaintg)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}
