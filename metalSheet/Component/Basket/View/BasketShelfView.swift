//
//  OrderHistory.swift
//  metalSheet
//
//  Created by Schweppe on 30/8/2566 BE.
//

import SwiftUI

struct BasketShelfView: View {
    var body: some View {
        VStack {
            Text("ตะกร้าสินค้า")
                .foregroundColor(.black).opacity(0.6)
                .font(.system(size:30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
            Spacer()
        }
        
    }
}

/*struct orderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BasketShelfView()
    }
}*/
