//
//  ProductHistoryRowView.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//

import SwiftUI

struct ProductHistoryRowView: View {
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    var viewModel: CartModel
 
    
    var calculatedPrice: Int{
        let currentPrice = viewModel.currentPrice
        let selectedLong = Int(addProductHistoryModel.selectedLong) ?? 1
        let selectedQty = Int(addProductHistoryModel.selectedQty) ?? 1
        return selectedQty * selectedLong * currentPrice
    }
    
    
  

    var body: some View {
        HStack(spacing: 30) {
            Image(viewModel.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130)
                .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                .cornerRadius(20)
            
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.productName).bold()
                
                VStack( alignment: .leading){
                    Text("ความหนา: \(viewModel.selectedCategory)มม.")
                    Text("ความยาว: \(viewModel.selectedLong) ม.")
                    Text("สี: \(viewModel.selectedColorCategory)")
                    Text("จำนวน: \(viewModel.selectedQty) ชิ้น.")
                   
              
                       
                }.font(.system(size: 14))
                    .foregroundColor(Color(.black).opacity(0.6))
                Text("฿ \(viewModel.calculatedPrice)")
                    .font(.subheadline)
                        .foregroundColor(Color(.black).opacity(0.8))
               
                
             
                
                
            }
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(Color(.red).opacity(0.8))
                .onTapGesture {
                    addProductHistoryModel.removeFromCart(product: viewModel)
                }
        }
        .padding(.horizontal)
        .frame(width: .infinity, alignment: .leading)
    }
}




struct ProductHistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductHistoryRowView(viewModel: CartModel(productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: "",total: 0))
            .environmentObject(AddProductViewModel())
    }
}
