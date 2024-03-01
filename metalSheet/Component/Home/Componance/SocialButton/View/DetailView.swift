//
//  DetailView.swift
//  metalSheet
//
//  Created by Schweppe on 21/10/2566 BE.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://line.me/ti/p/q_4GqY44yw")
    }
}
