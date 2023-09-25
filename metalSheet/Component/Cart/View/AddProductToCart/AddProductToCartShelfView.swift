//
//  DetailScreenView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI

struct AddProductToCartShelfView: View {
   
    var body: some View {
        ZStack {
            Color("Bgp")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                Image("product1")
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                    
               
                    .offset(y: -15)
                
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 120)
            }
            .edgesIgnoringSafeArea(.top)

            
           
            
        }
        
        .edgesIgnoringSafeArea(.bottom)
        
    }
}



struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductToCartShelfView()
    }
}
