//
//  DescriptionView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI
import NukeUI
import Combine

struct DescriptionView: View {
    
    
    @State private var selectedIndex: Int = 2
    @State var stepperLong: Float = 1.00
    @State var stepperQty: Int = 1
	//@State var currentPrice: Int = 1
	
	@State private var selectedColor: String?
	@State private var selectedBMT: String?
	@State private var selectedModelPrice: Int = 0 
    var viewmodel: CartModel
	var viewModel : DescriptionViewModel
	@EnvironmentObject var description: DescriptionViewModel
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
  /*  var isCategoryEnabled: Bool {
        return viewmodel.categories[selectedIndex] == "0.35"
    }*/
    
    

    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad

        ZStack {
            Color("Bgp")
                .edgesIgnoringSafeArea(.all)
			ScrollView {
				TabView {
					ForEach(viewModel.description) { infoModel in
						ForEach(infoModel.images, id: \.self) { imageUrl in
							LazyImage(source: imageUrl) { state in
								if let image = state.image{
									image
								}else {
									VStack{
										Image("removeTextLogo")
											.resizable()
											.aspectRatio(contentMode: .fit)
										Text("กำลังโหลด...")
											.foregroundColor(Color.black.opacity(0.7))
											.font(.subheadline)
									}
								}
							}
							.scaledToFit()
						.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
						}
						//.padding(.horizontal,5)
						//.padding(.horizontal,5)
					}
				}
				//.cornerRadius(20)
				.scaledToFill()
				.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)

				.tabViewStyle(PageTabViewStyle())
			/*	LazyImage(source: viewModel.description.first?.image ?? "") { state in
					if let image = state.image{
						image
					}else {
						VStack{
							Image("removeTextLogo")
								.resizable()
								.aspectRatio(contentMode: .fit)
							Text("กำลังโหลด...")
								.foregroundColor(Color.black.opacity(0.5))
								.font(.subheadline)
							
						}
					}
				}
				.aspectRatio(contentMode: .fit)
				.scaledToFit()*/
                   
                
                VStack (alignment: .leading,spacing: 10){
					Text(viewModel.description.first?.title ?? "")
                        .font(Font.custom("Pridi-Regular",size: isiPad ? 36 : 26))
                        .bold()
                    HStack {
						Text(updatePrice())
							.font(Font.system(size: isiPad ? 36 : 26))
                        
						Text("\(viewModel.description.first?.note ?? "")")
							.font(Font.custom("Pridi-Light",size: isiPad ? 28 : 18))
							.padding(.bottom,-5)
                    } .font(.system(size: isiPad ? 34 : 24))
                     
                       
                       
					Text("\(viewModel.description.first?.note2 ?? "")")
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .font(Font.custom("Pridi-Light",size: isiPad ? 27 : 17))
                    
                    Text("รายละเอียด")
                        
                        .font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
                        .fontWeight(.semibold)
                        .padding(.vertical, 4)
                    
					Text(" \(viewModel.description.first?.description ?? "")")
                        .lineSpacing(8.0)
                        .opacity(0.6)
                        .font(Font.custom("Pridi-Light",size: isiPad ? 28 : 20))
                   
					VStack(alignment: .leading,spacing: 20) {
						if let variations = viewModel.description.first?.variations {
							ForEach(0..<variations.count, id: \.self) { index in
								if variations.indices.contains(index) {
									let variation = variations[index]

									if variation.name == "สี" {
										ColorDotCategoryView(selectedColor:$selectedColor,colorCategories: variation.options, text: variation.name, isCategoryEnabled: true, selectedBMT: $selectedBMT)
									} else if variation.name == "ความหนา" {
										
										CategoryView(selectedBMT: $selectedBMT,text: variation.name, bmt: variation.options)
										
									}
								}
							}
							
						}
					}
					
					.padding()

					//addProductHistoryModel.updateisCategoryEnabled(isCategoryEnabled)
					//addProductHistoryModel.updateSelectedCategory(viewmodel.categories[i])
					
					//addProductHistoryModel.updateSelectedColorCategory("อลูซิงค์")
					HStack(alignment: .bottom) {
						if let variations = viewModel.description.first?.variations,
						   let thicknessVariation = variations.first(where: { $0.name == "ความหนา" }) {
							if !thicknessVariation.options.isEmpty {
								LabeledStepper2("ความยาว", description: "(เมตร)", value: $stepperLong, in: 1...22, longPressInterval: 0.09)
									.padding(.top, 10)
									.font(Font.custom("Pridi-Regular", size: isiPad ? 24 : 20))
									.bold()
							}
						}
					}
					.onChange(of: stepperLong) { newValue in
						let formattedValue = String(format: "%.2f", newValue)
						addProductHistoryModel.updateSelectedLong(formattedValue)
					}


          
                    
                    HStack(alignment: .bottom){
                        LabelStepperInt("จำนวน",description: "(ชิ้น)",value: $stepperQty, in:  1...1000,longPressInterval: 0.09)
                        
                            .padding(.top,10)
                            .font(Font.custom("Pridi-Regular",size: isiPad ? 24 : 20))
                            .bold()
                        
                    }.onChange(of: stepperQty) { newValue in
                        // Print the updated value when the stepper value changes
                        var stepperQty = ""
                        stepperQty = "\(newValue)"
                        addProductHistoryModel.updateSelectedQty(stepperQty)
                 
                    }
                    HStack{
                        Spacer()
                        Text("(แตะค้างหรือคลิกเพื่อพิมพ์เพื่อเพิ่มจำนวนอย่างรวดเร็ว)")
                            .foregroundColor(.red)
                            .opacity(0.8)
                            .font(Font.custom("Pridi-Light",size: isiPad ? 27 : 17))
                    }
                    
                 
                }
                .font(.system(size: isiPad ? 24 : 18))
             
                .padding()
                .background(Color("Bgp"))
            .cornerRadius(15.0)
            }
		
           
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
                    .modifier(KeyboardAwareModifier())
            }.edgesIgnoringSafeArea(.top)
                .onTapGesture {
                    // Hide the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
          
			FooterAddProductToCartView(viewModel: viewmodel, viewModel2: viewModel, stepperLong: $stepperLong, stepperQty: $stepperQty, selectedModelPrice: $selectedModelPrice,selectedBMT: $selectedBMT,selectedColor: $selectedColor)	

				
        }
        .edgesIgnoringSafeArea(.bottom)
       
        
        .toolbar{
			
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
	func updatePrice() -> String {
		if let selectedColor = selectedColor,
		   let selectedBMT = selectedBMT,
		   let selectedModel = viewModel.description.first?.models.first(where: { $0.name == "\(selectedBMT),\(selectedColor)" }) {
			let currentPrice = selectedModel.price ?? 0
		
			DispatchQueue.main.async {
				self.selectedModelPrice = currentPrice
			}
			return "฿\(currentPrice)"
		}else if   let selectedColor = selectedColor,
				   let selectedModel = viewModel.description.first?.models.first(where: { $0.name == "\(selectedColor)" }) {
			let currentPrice = selectedModel.price ?? 0
			
			DispatchQueue.main.async {
				self.selectedModelPrice = currentPrice
			}
			  return "฿\(currentPrice)"
			
			
		}else {
			// Return the default price range
		
			return "฿\(viewModel.description.first?.priceMin ?? 0) ~ \(viewModel.description.first?.priceMax ?? 0)"
		}
	}
}
//MARK: - Adjust Keyboard
struct KeyboardAwareModifier: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
          
            .onReceive(Publishers.keyboardHeight) {
                self.keyboardHeight = $0
            }
    }
}


extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        Publishers.Merge(
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
                .map { $0.keyboardHeight },
            NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in CGFloat(0) }
        )
        .eraseToAnyPublisher()
    }
}

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

/*struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(viewmodel: CartModel(id: 1, productImage: "product3", productName: "ลอคสแน๊ปลอค3", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง","อลูซิงค์"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: ""))
            .environmentObject(AddProductViewModel())
    }
}*/
