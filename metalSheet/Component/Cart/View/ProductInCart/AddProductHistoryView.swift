//
//  OrderHistoryView.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//

import SwiftUI

struct AddProductHistoryView: View {
    @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
    var viewModel: CartModel
    var body: some View {
        ScrollView {
            if addProductHistoryModel.items.count > 0 {
                ForEach(addProductHistoryModel.items, id: \.id){
                    item in
                    ProductHistoryRowView(viewModel: item).onTapGesture {
                        withAnimation(.linear){
                            addProductHistoryModel.updateItems(item: item)
                        }
                    }
                }
                HStack{
                    Text("ราคาสินค้าทั้งหมด")
                        .bold()
                    Spacer()
                    Text("฿\(viewModel.total).00")
                    
                        .bold()
                }
                .padding()
            }else {
                Text("ตะกร้าสินค้าว่างเปล่า")
                    .foregroundColor(.black.opacity(0.6))
                    .bold()
                    .font(.system(size: 25))
            }
        }
        .navigationTitle(Text("ตะกร้าสินค้า"))
        .padding(.top)
        
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductHistoryView(viewModel: CartModel(productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
            .environmentObject(AddProductViewModel())
    }
}
