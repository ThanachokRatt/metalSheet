//
//  ProductHistoryRowView.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//

import SwiftUI
import NukeUI

struct ProductHistoryRowView: View {
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    var viewModel: CartModel
    @Binding var isAddProducthistoryView: Bool

    var body: some View {
        HStack(spacing: 30) {
            LazyImage(source: viewModel.productImage) { state in
                if let image = state.image{
                    image
                }else {
                    Text("กำลังโหลด...")
                }
            }
                .aspectRatio(contentMode: .fit)
                .frame(width: 130)
                .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                .cornerRadius(20)
            
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.productName).bold()
                
                VStack( alignment: .leading){
                    Text("ความหนา: \(viewModel.selectedCategory) มม.")
                    Text("ความยาว: \(viewModel.selectedLong) ม.")
                    Text("สี: \(viewModel.selectedColorCategory)")
                    Text("จำนวน: \(viewModel.selectedQty) ชิ้น")
                   
              
                       
                }.font(.system(size: 14))
                    .foregroundColor(Color(.black).opacity(0.6))
                Text("฿ \(viewModel.calculatedPrice)")
                    .font(.subheadline.bold())
                        .foregroundColor(Color(.black).opacity(1))
                
            }
            Spacer()
            
            if isAddProducthistoryView{
                Image(systemName: "trash")
                    .foregroundColor(Color(.red).opacity(0.8))
                    .onTapGesture {
                        addProductHistoryModel.removeFromCart(product: viewModel)
                    }
            }
        }
        .padding(.horizontal)
        .frame(width: .infinity, alignment: .leading)
    }
}




