import SwiftUI

public struct SecureDMSFloatingTextField: View {
    var label: String
    @Binding var text: String
    var isError: Bool
    var errorMessage: String
    var onCommit: () -> Void
    @State var isSecure = true
    @FocusState var isFocused: Bool
    private var isFloaintg: Bool {
        isFocused || !text.isEmpty
    }
    private var isErrorAndNotEmpty: Bool {
        isError && !errorMessage.isEmpty
    }
    private var dmsForegroundColor: Color {
        isFocused ?
            .PrimaryVariant.primary :
        isError ?
            .System.error :
            .GrayScale.gray5
    }

    public init(
        _ label: String = "",
        text: Binding<String>,
        isError: Bool = false,
        errorMessage: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.label = label
        _text = text
        self.isError = isError
        self.errorMessage = errorMessage
        self.onCommit = onCommit
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Text(label)
                    .dmsFont(.body(.body2), color: dmsForegroundColor)
                    .offset(y: isFloaintg ? -40 : isErrorAndNotEmpty ? -10 : 0)
                    .scaleEffect(isFloaintg ? 0.8 : 1, anchor: .topLeading)
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
                .offset(y: isErrorAndNotEmpty ? -10 : 0)
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
                .dmsFont(.body(.body2), color: .GrayScale.gray9)
                .foregroundColor(dmsForegroundColor)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(dmsForegroundColor)
                        .frame(height: 1)
                        .offset(y: 7)
                }
                .focused($isFocused)
                .onSubmit(onCommit)

                if isErrorAndNotEmpty {
                    Text(errorMessage)
                        .dmsFont(.etc(.caption), color: .System.error)
                        .offset(x: 5)
                }
            }
        }
        .animation(.easeIn(duration: 0.3), value: isErrorAndNotEmpty)
        .animation(.easeIn(duration: 0.3), value: isError)
        .animation(.easeIn(duration: 0.3), value: isFloaintg)
        .animation(.easeIn(duration: 0.3), value: isFocused)
    }
}
