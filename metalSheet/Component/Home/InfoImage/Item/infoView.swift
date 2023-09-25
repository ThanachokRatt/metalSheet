//
//  infoView.swift
//  metalSheet
//
//  Created by Schweppe on 30/8/2566 BE.
//

import SwiftUI

struct infoView: View {
    let infoimage: InfoImage
    var body: some View {
        VStack {
            HStack{
                    Image(infoimage.infoImage)
                        .resizable()
                        .frame(width: 350 , height:250)
                        .cornerRadius(20)
                        
                        .overlay(RoundedRectangle(cornerRadius:  20).stroke(Color.black,lineWidth: 1))
                        
            }
  
        }
    }
    
    struct infoView_Previews: PreviewProvider {
        static var previews: some View {
            infoView(infoimage: .init(infoImage: "Image1"))
        }
    }
}
