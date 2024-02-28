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
	@EnvironmentObject var description: DescriptionViewModel

    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        HStack(spacing: 20) {
            LazyImage(source: viewModel.productImage) { state in
                if let image = state.image{
                    image
                }else {
                    Text("กำลังโหลด...")
                }
            }
                .aspectRatio(contentMode: .fit)
                .frame(width:  isiPad ? 240 : 140)
                .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                .cornerRadius(20)
            
            VStack(alignment: .leading,spacing: 2) {
                Text(viewModel.productName)
                    .font(Font.custom("Pridi-Regular",size: isiPad ? 23 : 13))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom,-6)
                
                VStack( alignment: .leading,spacing: 0){
                   
					
					if !viewModel.selectedCategory.isEmpty {
						Text("ความหนา : \(viewModel.selectedCategory) มม.")
						  }
					if !viewModel.selectedCategory.isEmpty{
						Text("ความยาว : \(viewModel.selectedLong) ม.")
					}
				
					
					
                    Text("สี : \(viewModel.selectedColorCategory)")
					if !viewModel.selectedAddOnsCategory.isEmpty {
						Text("ลายท้อง : \(viewModel.selectedAddOnsCategory)")
					}
					
					Text("ราคา : \(viewModel.currentPrice)")
					Text("จำนวน : \(viewModel.selectedQty) ชิ้น")
					
			
				
					
                   
              
                       
                }.font(Font.custom("Pridi-Light",size: isiPad ? 22 : 13))
                    .foregroundColor(Color(.black).opacity(0.6))
                
                Text("฿ \(viewModel.calculatedPrice)")
                    .font(.system(size: isiPad ? 25 : 15)).bold()
                        .foregroundColor(Color(.black).opacity(1))
                
            }
            Spacer()
            
            if isAddProducthistoryView{
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: isiPad ? 28 : 18,height: isiPad ? 28 : 18)
                    .foregroundColor(Color(.red).opacity(0.8))
                    .onTapGesture {
                        addProductHistoryModel.removeFromCart(product: viewModel)
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical,4)
        .frame(width: .infinity, alignment: .leading)
    }
}




