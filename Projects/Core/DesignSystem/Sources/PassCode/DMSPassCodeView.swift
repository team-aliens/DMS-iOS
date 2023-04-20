import SwiftUI
import Combine

public struct DMSPassCodeView: View {

    @State var codeCount: Int
    @Binding var text: String
    @FocusState var focused: Bool

    public init(
        codeCount: Int,
        text: Binding<String>
    ) {
        self.codeCount = codeCount
        _text = text
    }

    public var body: some View {
        VStack {
            ZStack {
                TextField("", text: $text)
                    .focused($focused)
                    .keyboardType(.numberPad)
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .onReceive(Just(text), perform: { _ in
                        if codeCount < text.count {
                            text = String(text.prefix(codeCount))
                        }
                    })

                HStack(spacing: 20) {
                    ForEach(1...codeCount, id: \.self) { num in
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(text.count >= num ? Color.GrayScale.gray6 : Color.GrayScale.gray4)
                            .onTapGesture {
                                focused = true
                            }
                    }
                }
            }
            .onAppear {
                self.focused = true
            }
        }
    }
}
