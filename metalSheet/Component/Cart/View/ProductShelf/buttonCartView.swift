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
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        NavigationLink (destination: AddProductHistoryView(viewModel: CartModel(id: 1, productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "")), label: {
            
            ZStack(alignment: .topTrailing) {
                Circle()
                              .foregroundColor(Color("lipstick"))
                              .frame(width: isiPad ? 45 : 35, height: isiPad ? 45 : 35)
                              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -6))
                
                Image(systemName: "basket")
                    .resizable()
                    .frame(width: isiPad ? 32 : 22,height: isiPad ? 32 : 22)
                    .padding(.top,5)
                    .foregroundColor(.white)
                
                
                if numberOfProduct > 0 {
                    
                    Text("\(numberOfProduct)")
                        .font(.system(size: isiPad ? 16 : 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: isiPad ? 24 : 14,height: isiPad ? 24 : 14)
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
