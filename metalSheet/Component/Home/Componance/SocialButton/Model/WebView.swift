//
//  WebView.swift
//  metalSheet
//
//  Created by Schweppe on 21/10/2566 BE.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let urlString: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView:WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
}
