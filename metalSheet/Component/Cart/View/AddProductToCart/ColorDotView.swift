//
//  ColorDotView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//
// let ColorCategory = ["Black","White","Blue","Brown","Pink","Gray","Red","Yellow"]
import SwiftUI

struct ColorCategoryView: View {
	@Binding var selectedColor: String?
	let color: String
	@Binding var selectedBMT: String?
	@EnvironmentObject var addProductHistoryModel: AddProductViewModel
	var body: some View {
		ColorDotView(color: Color(color))
			.onTapGesture {
				
				selectedColor = color
				addProductHistoryModel.updateSelectedColorCategory(color)
				//print("Selected Color: \(color)") // Print the selected color
			}
			
			.overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color(selectedColor == color ? "lipstick" : "ดำเงา" ),lineWidth:  selectedColor == color ? 4 : 1))
		   
	}
}

struct ColorDotView: View {
	let color: Color

	var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		color
			.frame(width: isiPad ? 36: 28, height: isiPad ? 36: 28)
			.clipShape(Circle())
	}
}

struct ColorDotCategoryView: View {
	
	@Binding var selectedColor: String? //= "อลูซิงค์"
	let colorCategories: [String]
	let text : String
	let isCategoryEnabled: Bool
	@Binding var selectedBMT: String?
  
	private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 8)
	

	var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad

		 VStack(alignment: .leading) {
		
			 if selectedBMT == "0.20" || selectedBMT == "0.23" || selectedBMT == "0.25"  || selectedBMT == "0.40" || selectedBMT == "0.47" {
				 Text("\(text) : อลูซิงค์")
					 .font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
					 .bold()
							 } else {
								 Text("\(text) : \(selectedColor ?? "")")
									 .font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
									 .bold()
							 }
			// Text("สี : \(isCategoryEnabled ? selectedColor ?? "อลูซิงค์" : "อลูซิงค์")")
				 
			

			 LazyVGrid(columns: columns, spacing: 5) {
				 ForEach(colorCategories, id: \.self) { color in
					 if selectedBMT == nil || selectedBMT == "0.35" || color == "อลูซิงค์" || selectedBMT == "" {
								 ColorCategoryView(selectedColor: $selectedColor, color: color, selectedBMT: $selectedBMT)
							 
					 }
				 }
				 
			 }
		 }
		 .onChange(of: selectedBMT) { newValue in
			 if selectedBMT == "0.20" || selectedBMT == "0.23" || selectedBMT == "0.25" || selectedBMT == "0.30" || selectedBMT == "0.40" || selectedBMT == "0.47" {
				 selectedColor = "อลูซิงค์"
			 }
		 }

		
	 }
	
 }
