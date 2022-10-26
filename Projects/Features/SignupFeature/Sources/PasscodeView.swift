import SwiftUI

import Combine

struct PasscodeView: View {
    @Binding var text: String
    @FocusState var focused: Bool

    var body: some View {
        VStack {
            ZStack {
                TextField("", text: $text)
                    .focused($focused)
                    .keyboardType(.numberPad)
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .onReceive(Just(text), perform: { _ in
                        if 8 < text.count {
                            text = String(text.prefix(8))
                        }
                    })

                HStack(spacing: 20) {
                    ForEach(1...8, id: \.self) { num in
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(text.count >= num ? Color.GrayScale.gray6 : Color.GrayScale.gray4)
                    }
                }
            }
            .onAppear {
                self.focused = true
            }
        }
    }
}
