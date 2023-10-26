//
//  productSingleView.swift
//  metalSheet
//
//  Created by Schweppe on 8/9/2566 BE.
//
import SwiftUI
import NukeUI

struct productSingleView: View {
   
    var viewmodel: CartModel
 
    var body: some View {
        HStack {
            VStack(){
                LazyImage(source: viewmodel.productImage) { state in
                    if let image = state.image{
                        image
                    }else {
                        VStack{
                            Image("removeTextLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text("กำลังโหลด...")
                                .foregroundColor(Color.black.opacity(0.5))
                                .font(.subheadline)
                            
                        }
                   
                       
                    }
                }
                    .scaledToFit()
                    .frame(width: 176, height: 178)
                    .cornerRadius(15)
                   .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 1))
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
