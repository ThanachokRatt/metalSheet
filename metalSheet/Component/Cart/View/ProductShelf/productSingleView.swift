//
//  productSingleView.swift
//  metalSheet
//
//  Created by Schweppe on 8/9/2566 BE.
//

import SwiftUI

struct productSingleView: View {
   
    var viewmodel: CartModel
 
    var body: some View {
        HStack {
            VStack(){
                Image(viewmodel.productImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 178,height: 180)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black,lineWidth:  1))
                Text(viewmodel.productName)
                        .fontWeight(.bold)
                        .opacity(0.7)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                
                        .font(.system(size:15))
                   
                }
                        
            }
            
               
                
            
        
    }
}


