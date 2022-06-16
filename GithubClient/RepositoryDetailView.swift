//
//  RepositoryDetailView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/16.
//

import SwiftUI
import WebKit

struct RepositoryDetailView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var url : URL = URL(string: "https://github.com/yuma1217/actions-unity")!
    static var previews: some View {
        RepositoryDetailView(url: url)
    }
}
