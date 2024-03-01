//
//  AddonsView.swift
//  metalSheet
//
//  Created by Schweppe on 26/2/2567 BE.
//

import SwiftUI

struct AddonsTextView: View {
	let text: String
	
    var body: some View {
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
					Text(text)
						.padding(5)
						//.overlay(RoundedRectangle(cornerRadius:  0).stroke(Color.black,lineWidth: 1))
		
		.font(Font.custom("Pridi-Light",size: isiPad ? 30 : 16))
		
    }
}

struct AddonsTabTextView:View{
	@Binding var selectedAddOns: String?
	@EnvironmentObject var addProductHistoryModel: AddProductViewModel
	let addOns: String
	var body: some View{
		AddonsTextView(text: addOns)
			.onTapGesture {
				selectedAddOns = addOns
				//print("Selected Add-Ons: \(addOns)")
				addProductHistoryModel.updateSelectedAddOnsCategory(addOns)
			}
			.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(selectedAddOns == addOns ? "lipstick" : "ดำ" ),lineWidth:  selectedAddOns == addOns ? 3 : 1))
			.shadow(radius: 1)
		
	}
}

struct AddonsCategoryView : View{
	let text : String
	let addOnsCategories : [String]
	
	@Binding var selectedAddOns: String?
	
	private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
	
	var body: some View{
		let isiPad = UIDevice.current.userInterfaceIdiom == .pad
		VStack(alignment: .leading){
			Text("\(text) : \(selectedAddOns ?? "")")
				.font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
				.bold()
			
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(addOnsCategories, id: \.self) { addOn in
						AddonsTabTextView(selectedAddOns: $selectedAddOns, addOns: addOn)
					}
				}
				.padding(.leading,5)
			}
			
		}
	}
}
//#Preview {
  //  AddonsView()
//}
/*LazyVGrid(columns: columns, alignment: .leading, spacing: 6){
				ForEach(addOnsCategories,id: \.self){
					addOn in
					AddonsTabTextView(selectedAddOns: $selectedAddOns, addOns: addOn)
				}
			}*/
