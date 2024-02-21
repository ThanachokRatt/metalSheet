//
//  forloopProductView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
import NukeUI
//@EnvironmentObject var cartViewModel: CartViewModel
import SwiftUI

struct ProductCartView: View {
	@EnvironmentObject var addProductHistoryModel: AddProductViewModel
	@StateObject var viewModel: CartViewModel = CartViewModel()
	@EnvironmentObject var description: DescriptionViewModel
	@State private var isDescriptionViewActive = false
	@State private var selectedProductId: String?
	let isiPad = UIDevice.current.userInterfaceIdiom == .pad
	let itemsPerRow = 2 // จำนวนรายการต่อแถว
	
	var body: some View {

		ZStack{
			VStack {
				ScrollView {
					TextWithTitle("สินค้าแนะนำ")
						.padding(15)
					productHstckShelf(viewModel: self.viewModel)
					TextWithTitle("รายการสินค้า")
						.padding(15)
					if !viewModel.cartModel.isEmpty {
						LazyVStack(alignment: .center, spacing: 20) {
							ForEach(0..<viewModel.cartModel.count, id: \.self) { index in
								if index % itemsPerRow == 0 {
									LazyHStack(spacing: 20) {
										ForEach(index..<min(index + itemsPerRow, viewModel.cartModel.count), id: \.self) { subIndex in
											productView(for: subIndex)
											
											
										}
									}
								}
							}
							
						}
						.safeAreaInset(edge: .bottom) {
							Color.clear.frame(height: 120)
						}
						.ignoresSafeArea()
						//.background(Color(.white).opacity(0.2))
						
					}else{
						ProgressView()
						Text("กำลังโหลด...")
							.font(.subheadline)
							.foregroundColor(Color.white.opacity(0.5))
					}
					
					
				}.background(Color.white)
					
				
				
			}.background(Color.white)
			
		}
		.toolbar{
			ToolbarItem(placement: .navigationBarLeading) {
				let isiPad = UIDevice.current.userInterfaceIdiom == .pad
					Image("removeBgLogo")
					.resizable()
					.scaledToFit()
					.frame(width: isiPad ? 65 : 55)
					.shadow(radius: 2)
				
			}
		
			
			ToolbarItem(placement: .navigationBarTrailing){
				HStack(spacing: 0){
					FaceBookButton()
					LineButton()
					buttonCartView(numberOfProduct: addProductHistoryModel.items.count)
				}
				
			}
			
		}
		.toolbarColorScheme(.light, for: .navigationBar)
		
	}
	func TextWithTitle(_ title: String) -> some View {
		Text(title)
			.foregroundColor(.black)
			.font(Font.custom("Pridi-Regular", size: isiPad ? 40 : 30))
			.fontWeight(.bold)
			.frame(maxWidth: .infinity, alignment: .leading)
			
	}
	@ViewBuilder
	func productView(for index: Int) -> some View {
		let cartModel = viewModel.cartModel[index]
		
		NavigationLink(
			destination: DescriptionView(viewmodel: cartModel, viewModel: description),
			tag: cartModel.id ?? "",
			selection: $selectedProductId
		) {
			productSingleView(viewmodel: cartModel)
				.frame(maxWidth: .infinity)
				.onTapGesture {
					if let productId = cartModel.id {
						description.productid = productId
						description.isDataFetched = false
						description.fetchDataDesFromApi()
						selectedProductId = productId
					}
				}
		}
		
	}

	
	
}
/*struct ProductCartView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCartView()
            .environmentObject(AddProductViewModel())
        
    }
}*/
