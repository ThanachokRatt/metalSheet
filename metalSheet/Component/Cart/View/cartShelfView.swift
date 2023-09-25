//
//  cartView.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
//

import SwiftUI

struct cartShelfView: View {
    @StateObject var viewModel1: CartViewModel = CartViewModel()
    
    
    let itemsPerRow = 2 // จำนวนรายการต่อแถว
    
    var body: some View {
      
            ZStack {
                VStack {
                    searchProductView(numberOfProduct: 1)
                    
                    
                    ProductCartView()
                    Spacer()
                }
            }

        
    }
    
    
    
    struct cartView_Previews: PreviewProvider {
        static var previews: some View {
            cartShelfView()
        }
    }
}
