//
//  OrderHistoryView.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//


import SwiftUI

struct AddProductHistoryView: View {
    @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
    @State private var isaddProductHistoryView = true
    var viewModel: CartModel
	
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
            ScrollView {
				LazyVStack{
					if addProductHistoryModel.items.count > 0 {
						ForEach(addProductHistoryModel.items, id: \.id){
							item in
							ProductHistoryRowView(viewModel: item, isAddProducthistoryView: $isaddProductHistoryView).onTapGesture {
								withAnimation(.linear){
									addProductHistoryModel.updateItems(item: item)
								}
							}
						}
						HStack{
							Text("ราคาสินค้าทั้งหมด")
						  
							Spacer()
							Text("฿ \(String(format:"%.2f",(addProductHistoryModel.total)))")
								.font(.system(size: isiPad ? 27 : 17))
							
						}
						.font(Font.custom("Pridi-Regular",size: isiPad ? 29 : 19))
						.bold()
						.padding()
						HStack{
							NavigationLink(destination: orderView(viewModel: viewModel)) {
								HStack {
									Text("สั่งสินค้า")
										.padding()
										.foregroundColor(.white)
										.cornerRadius(10)
								}
								.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
								.frame(maxWidth: .infinity)
								.background(Color("lipstick"))
								.foregroundColor(.white)
								.cornerRadius(10) // Adjust horizontal padding
								.padding()
							}
						}
					}else {
						Text("ตะกร้าสินค้าว่างเปล่า")
							.foregroundColor(.black.opacity(0.6))
							.bold()
							.font(Font.custom("Pridi-Light",size: isiPad ? 37 : 27))
					}
				}
				.navigationTitle(Text("ตะกร้า"))
				.navigationBarTitleDisplayMode(.inline)
			.padding(.top)
			
			
		}
				}
   
}
/*struct AddProductHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductHistoryView(viewModel: CartModel(id: 1, productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: ""))
            .environmentObject(AddProductViewModel())
    }
}*/
