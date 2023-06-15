//
//  MyWebView.swift
//  SwiftUITestProject
//
//  Created by 김동우 on 2023/06/12.
//

import SwiftUI
import WebKit

// uikit의 uiview를 사용할 수 있도록 한다.
// UIViewControllerRepresentable

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String
    
    // UI View 만들기
    func makeUIView(context: Context) -> some WKWebView {
        guard let url = URL(string: self.urlToLoad) else { return WKWebView() }
        
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    
    // 업데이트 UI View
    func updateUIView(_ uiView: UIViewType,
                      context: UIViewRepresentableContext<MyWebView>) {
        
    }
    
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
