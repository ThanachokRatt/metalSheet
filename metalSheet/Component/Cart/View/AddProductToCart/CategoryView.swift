//
//  CategoryView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI



struct CategoryView: View {
	@Binding var selectedBMT: String?
	
	@EnvironmentObject var addProductHistoryModel: AddProductViewModel
	let text: String
	let bmt: [String]
	var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		
		VStack(alignment: .leading, spacing: 5) {
			Text("\(text)")
			
			
			HStack {
				ForEach(bmt, id: \.self) { item in
					Button(action: {
						selectedBMT = item
					//	print("Selected BMT: \(selectedBMT ?? "")")
						addProductHistoryModel.updateSelectedCategory(selectedBMT ?? "")
					}) {
						VStack(spacing: 0) {
							Text(item)
								.font(.system(size: isiPad ? 24 : 16))
								.fontWeight(.medium)
							
								.foregroundColor( Color.black)
							
							
							if selectedBMT == item {
								Color("lipstick")
									.frame(width: isiPad ? 48 : 34, height: 3)
							}
						}
					}
				}
			}
		}
		.font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
		.bold()
	}
}
