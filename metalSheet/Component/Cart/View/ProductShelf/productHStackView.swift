//
//  productHStackView.swift
//  metalSheet
//
//  Created by Schweppe on 6/2/2567 BE.
//

import SwiftUI
import NukeUI

struct productHStackView: View {
	var viewmodel: CartModel
	
	var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		
			VStack(){
				LazyImage(source: viewmodel.productImage) { state in
					if let image = state.image{
						image
						
					}else {
						VStack{
							Image("removeTextLogo")
								.resizable()
								.aspectRatio(contentMode: .fill)
								
							Text("กำลังโหลด...")
								.foregroundColor(Color.black.opacity(0.5))
								.font(.subheadline)
								
							
						}
						
						
					}
				}
				
				.scaledToFill()
				.frame(width: isiPad ? 300 : 280, height: isiPad ? 300 : 280)
			
				.cornerRadius(10)
				.shadow(radius: 3 )
				
				
				
			}
		}
	}

//#Preview {
//	productHStackView(viewmodel: CartModel(id: "1", productImage: "https://res.cloudinary.com/daz3a6zv4/image/upload/v1701889493/Image_product/eapbqoyejx2zx3hlmgpq.jpg", productName: "ลอน", description: "d", categories: ["0.25","0.30"], priceNocolor: 123, priceColor: 123, colorCategories: ["d"], currentPrice: 1, selectedCategory: "12", selectedColorCategory: "123", selectedLong: "123", selectedQty: "123"))
//	}

