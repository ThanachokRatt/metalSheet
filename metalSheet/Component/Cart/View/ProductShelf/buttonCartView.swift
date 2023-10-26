//
//  buttonCart.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//
import SwiftUI

struct buttonCartView: View {
    var numberOfProduct: Int
    
    var body: some View {
        NavigationLink (destination: AddProductHistoryView(viewModel: CartModel(id: 1, productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "")), label: {
            
            ZStack(alignment: .topTrailing) {
                Image(systemName: "basket")
                    .resizable()
                    .frame(width: 25,height: 25)
                    .padding(.top,5)
                    .foregroundColor(.black)
                
                
                if numberOfProduct > 0 {
                    Text("\(numberOfProduct)")
                        .font(.caption2).bold()
                        .foregroundColor(.white)
                        .frame(width: 14,height: 14)
                        .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .cornerRadius(50)
                        .padding(.trailing, -7)
                        .padding(.top, -1)
                    
                }
                

            }
               
               
            
        })
    }
}

struct buttonCartView_Previews: PreviewProvider {
    static var previews: some View {
        buttonCartView(numberOfProduct: 1)
    }
}
