//
//  AddtoCartView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//
	import SwiftUI

	struct FooterAddProductToCartView: View {
		@EnvironmentObject var addProductHistoryModel: AddProductViewModel
		@EnvironmentObject var loginViewModel: LoginViewModel
		var viewModel: CartModel
		var viewModel2 : DescriptionViewModel
		
		@Binding var stepperLong: Float // Binding to stepperLong
		@Binding var stepperQty: Int
		@State private var isLoginSheetPresented = false
		@Binding var selectedModelPrice: Int // Use State instead of Binding
		@Binding var selectedBMT: String?
		@Binding var selectedColor: String?
		@Binding var selectedAddOns: String?
		@State private var showAlert = false
		@State private var alertMessage = ""
		

		var body: some View {
			VStack{
				
				Spacer()
				
				Button(action: {
					
					if  viewModel2.description.first?.variations.first?.name == "ความหนา" &&  selectedBMT == nil  {
						   showAlert = true
						   alertMessage = "กรุณาเลือกความหนา"
	
					} else if selectedColor == nil {
						showAlert = true
						alertMessage = "กรุณาเลือกสี"
					} else if selectedAddOns == nil && viewModel2.description.first?.addons.first?.name != nil {
						showAlert = true
						alertMessage = "กรุณาเลือกลายท้อง"
					} else {
						// Perform your action when everything is selected
					//	print(stepperQty)
					//	print(stepperLong)
					//	print(selectedModelPrice)
						addProductHistoryModel.updateCurrentPrice2(selectedModelPrice)
						addProductHistoryModel.addToCart(product: viewModel)
						addProductHistoryModel.updateCurrentPrice(product: viewModel)
						addProductHistoryModel.updateSelectedCategory("")
						addProductHistoryModel.updateSelectedAddOnsCategory("")
						stepperLong = 1.00
						stepperQty = 1
						selectedBMT = nil
						selectedColor = nil
						selectedAddOns = nil
						addProductHistoryModel.updateSelectedColorCategory("อลูซิงค์")
						
					}
						
					
					
					
				  /*  if loginViewModel.isLoggedIn{
					  
					}else{
						isLoginSheetPresented.toggle()
					}*/
				   
				}, label: {
					VStack (spacing: 5){
						Image(systemName: "basket")
							.font(.system(size: 16))
							.foregroundColor(.white)
						   
						Text("เพิ่มลงตะกร้า")
							.font(.system(size: 17, weight: .bold))
							.foregroundColor(.white)
						   
					}
					.frame(maxWidth: .infinity)
					.padding(.vertical, 8)
					/*.background(
						LinearGradient(gradient: Gradient(colors: [Color("orange"), Color("red1"), Color("red1")]),
									   startPoint: .topLeading,
									   endPoint: .bottomTrailing)
						.opacity(1)
									)*/
					.background(Color("lipstick"))
					
					.shadow(radius: 3)
					.cornerRadius(10)
				  
				})
				.alert(isPresented: $showAlert) {
							   Alert(
								   title: Text("แจ้งเตือน"),
								   message: Text(alertMessage)
									.font(.system(size: 48)),
								   dismissButton: .default(Text("ตกลง"))
							   )
				}.preferredColorScheme(.light)
			}
			.preferredColorScheme(.light)
			.padding(EdgeInsets(top: 16, leading: 12, bottom: 20, trailing: 12))
			.padding(.horizontal)
		  
			
		   // .cornerRadius(50, corners: .topLeft)
			
			.frame(maxHeight: .infinity, alignment:  .bottom)
			
		}
	}

/*struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}*/


