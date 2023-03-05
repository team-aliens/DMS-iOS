import SwiftUI

struct ToastPlaygroundView: View {
    @State var isInfo = false
    @State var isError = false
    @State var isSuccess = false

    var body: some View {
        VStack(spacing: 16) {
            Button {
                withAnimation {
                    isInfo.toggle()
                }
            } label: {
                Text("Info")
            }
            Button {
                withAnimation {
                    isError.toggle()
                }
            } label: {
                Text("Error")
            }
            Button {
                withAnimation {
                    isSuccess.toggle()
                }
            } label: {
                Text("Success")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .dmsToast(isShowing: $isInfo, message: "메시지", style: .info)
        .dmsToast(isShowing: $isError, message: "메시지", style: .error)
        .dmsToast(isShowing: $isSuccess, message: "메시지", style: .success)
    }
}

struct ToastPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ToastPlaygroundView()
    }
}
