//
//  mapItemView.swift
//  metalSheet
//
//  Created by Schweppe on 31/8/2566 BE.
//

import SwiftUI

struct mapItemView: View {
    let imageName: String
    let imageURL: String
    
    var body: some View {
      
            Link(destination: URL(string: imageURL)!,
            label: {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth:  1))
                    .padding()
            })
        
    }
}

struct mapItemView_Previews: PreviewProvider {
    static var previews: some View {
        mapItemView(imageName: "lumluka", imageURL: "qwe")
    }
}
