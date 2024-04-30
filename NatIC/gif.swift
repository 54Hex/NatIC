//
//  gif.swift
//  NatIC
//
//  Created by WX on 30/4/24.
//

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.contentMode = .scaleAspectFit

        if let url = Bundle.main.url(forResource: gifName, withExtension: "gif") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update the view if needed
    }
}

struct GifView: View {
    var body: some View {
        GIFView(gifName: "holog")
            .frame(width: 50, height: 30)
            .aspectRatio(contentMode: .fit)
            .offset(x: 0, y:0)
//            .offset(x: -105, y: -160)
    }
}


#Preview {
    GifView()
}
