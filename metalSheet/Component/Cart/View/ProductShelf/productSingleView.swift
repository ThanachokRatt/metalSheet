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
    
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
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
				
                    .scaledToFill()
                    .frame(width: isiPad ? 276 : 176, height: isiPad ? 278 : 178)
                    .cornerRadius(15)
					.shadow(radius: 10)
                 //  .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0))
                Text(viewmodel.productName)
                       
                       
                        
					    .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
						
                        .font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 19))
                        .padding(.top,-3)
                }
                        
            }
            
               
                
            
        
    }
    
}
