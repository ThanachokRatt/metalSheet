//
//  infoImageView2.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
//

import SwiftUI

struct infoImageView2: View {
    
    let infoImage: [String] = ["Image1","Image2","Image3","Image4"]
    
    var body: some View {
        TabView{
            ForEach(infoImage, id: \.self) { infoimage in
                Image(infoimage)
                    .resizable()
                
                    .cornerRadius(15.0)
                    .overlay(RoundedRectangle(cornerRadius:15.0).stroke(Color.black, lineWidth: 1))
            }
        }
        .frame(width: .infinity, height: 280)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        .tabViewStyle(PageTabViewStyle())
    }
}

struct infoImageView2_Previews: PreviewProvider {
    static var previews: some View {
        infoImageView2()
    }
}
