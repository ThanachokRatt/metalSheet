//
//  productSingleView2.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//

import SwiftUI

struct productSingleView2: View {
    let productImage2: String
    let productName2: String
 
    var body: some View {
        VStack {
            HStack {
                VStack{
                    Image(productImage2)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 188,height: 190)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black,lineWidth:  1))
                    Text(productName2)
                        .fontWeight(.bold)
                        .opacity(0.7)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.system(size:15))
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 0))
                }
                
                        
            }
               
                
            
        }
    }
}

struct productSingleView2_Previews: PreviewProvider {
    static var previews: some View {
        productSingleView(productImage1: "product2", productName1: "ลอนมาตรฐาน760+พียูโฟม")
    }
}
