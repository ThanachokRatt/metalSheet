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
    
   var viewmodel: CartModel
    
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    
    var isCategoryEnabled: Bool {
        return viewmodel.categories[selectedIndex] == "0.35"
    }
    
    

    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad

        ZStack {
            Color("Bgp")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                
                LazyImage(source: viewmodel.productImage) { state in
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
                .scaledToFit()
                   
                
                VStack (alignment: .leading,spacing: 10){
                    Text(viewmodel.productName)
                        .font(Font.custom("Pridi-Regular",size: isiPad ? 36 : 26))
                        .bold()
                    HStack {
                        Text("฿\(isCategoryEnabled ? viewmodel.priceColor : viewmodel.priceNocolor) ")
                           
                        
                        Text("(ราคาต่อเมตร)")
                            .font(Font.custom("Pridi-Light",size: isiPad ? 26 : 16))
                            .padding(.bottom,-5)
                    } .font(.system(size: isiPad ? 34 : 24))
                     
                       
                       
                    Text("(สามารถเลือกสีได้เฉพาะความหนา 0.35มิลลิเมตร)")
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .font(Font.custom("Pridi-Light",size: isiPad ? 27 : 17))
                    
                    Text("รายละเอียด")
                        
                        .font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
                        .fontWeight(.semibold)
                        .padding(.vertical, 4)
                    
                    Text(" \(viewmodel.description)")
                        .lineSpacing(8.0)
                        .opacity(0.6)
                        .font(Font.custom("Pridi-Light",size: isiPad ? 28 : 20))
                   
                    HStack (alignment: .top){
                        VStack(alignment: .leading) {
                            Text("ความหนา(มิลลิเมตร)")
                            
                                .fontWeight(.semibold)
                                .font(Font.custom("Pridi-Regular",size: isiPad ? 28 : 20))
                                .padding(.bottom,4)
                            
                            HStack{
                                ForEach(0 ..< viewmodel
                                    .categories.count) { i in
                                        CategoryView(isActive: i == selectedIndex, text: viewmodel.categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                            addProductHistoryModel.updateisCategoryEnabled(isCategoryEnabled)
                                            addProductHistoryModel.updateSelectedCategory(viewmodel.categories[i])
                                            if viewmodel
                                                .categories[i] != "0.35"{
                                                
                                                addProductHistoryModel.updateSelectedColorCategory("อลูซิงค์")
                                             
                                                
                                                
                                                
                                            }
                                            
                                        }
                                }
                            }
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                        
                        
                    }
                    .padding(.vertical)
                    
                    ColorDotCategoryView(colorCategories: isCategoryEnabled ? viewmodel.colorCategories : viewmodel.colorCategories2, isCategoryEnabled: isCategoryEnabled)
                    
                    
                    HStack(alignment: .bottom) {
                        LabeledStepper2("ความยาว", description: "(เมตร)", value: $stepperLong, in: 1...22,longPressInterval: 0.09)
                            .padding(.top, 10)
                            .font(Font.custom("Pridi-Regular",size: isiPad ? 24 : 20))
                            .bold()
                            
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
          
            FooterAddProductToCartView(viewModel: viewmodel,stepperLong: $stepperLong,stepperQty: $stepperQty)
        }
        .edgesIgnoringSafeArea(.bottom)
       
        
        .toolbar{
            buttonCartView(numberOfProduct: addProductHistoryModel.items.count)
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
