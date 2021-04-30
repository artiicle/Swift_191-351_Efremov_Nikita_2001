import SwiftUI

import WebKit


struct WebView: UIViewRepresentable {
    var pageURL:String     // Page to load
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView() // Just make a new WKWebView, we don't need to do anything else here.
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {

        uiView.load(pageURL)     // Send the command to WKWebView to load our page
    }
}


// Extension for WKWebView so we can just pass a URL string to .load() instead of all the boilerplate
extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}

