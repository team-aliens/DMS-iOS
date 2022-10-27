import SwiftUI
import WebKit

public struct DMSWebView: UIViewRepresentable {
    var urlToLoad: String

    public init(urlToLoad: String) {
        self.urlToLoad = urlToLoad
    }

    public func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }

        let webView = WKWebView()

        DispatchQueue.main.async {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<DMSWebView>) {}
}
