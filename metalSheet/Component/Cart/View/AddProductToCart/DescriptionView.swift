//
//  DescriptionView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI
import NukeUI
import LabeledStepper
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
                        Text("กำลังโหลด...")
                    }
                }
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                   
                
                VStack (alignment: .leading,spacing: 10){
                    Text(viewmodel.productName)
                        .font(.system(size: isiPad ? 34 : 24))
                        .bold()
                    HStack {
                        Text("฿\(isCategoryEnabled ? viewmodel.priceColor : viewmodel.priceNocolor) ")
                           
                        
                        Text("(ราคาต่อเมตร)")
                            .font(.system(size: isiPad ? 24 : 14))
                            .padding(.bottom,-5)
                    } .font(.system(size: isiPad ? 34 : 24))
                     
                       
                       
                    Text("(สามารถเลือกสีได้เฉพาะความหนา 0.35มิลลิเมตร)")
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .font(.system(size: isiPad ? 25 : 15))
                    
                    Text("รายละเอียด")
                        .fontWeight(.medium)
                        .font(.system(size: isiPad ? 26 : 16))

                        .padding(.vertical, 8)
                    
                    Text(viewmodel.description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                   
                    HStack (alignment: .top){
                        VStack(alignment: .leading) {
                            Text("ความหนา(มิลลิเมตร)")
                            
                                .fontWeight(.semibold)
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
                        LabeledStepper2("ความยาว", description: "(เมตร)", value: $stepperLong, in: 1...22,longPressInterval: 0.04)
                            .padding(.top, 10)
                            .font(.system(size:isiPad ? 20 : 16))
                            .bold()
                    }
                    .onChange(of: stepperLong) { newValue in
                        var formattedValue = String(format: "%.2f", newValue)
                        addProductHistoryModel.updateSelectedLong(formattedValue)
                    }

          
                    
                    HStack(alignment: .bottom){
                        LabeledStepper("จำนวน",description: "(ชิ้น)",value: $stepperQty, in:  1...1000,longPressInterval: 0.06)
                        
                            .padding(.top,10)
                            .font(.system(size:isiPad ? 20 : 16))
                            .bold()
                    }.onChange(of: stepperQty) { newValue in
                        // Print the updated value when the stepper value changes
                        var stepperQty = ""
                        stepperQty = "\(newValue)"
                        addProductHistoryModel.updateSelectedQty(stepperQty)
                 
                    }
                    HStack{
                        Spacer()
                        Text("(แตะค้างเพื่อเพิ่มจำนวนอย่างรวดเร็ว)")
                            .foregroundColor(.red)
                            .opacity(0.8)
                            .font(.system(size: isiPad ? 24 : 15))
                    }
                    
                 
                }
                .font(.system(size: isiPad ? 24 : 16))
             
                .padding()
                .background(Color("Bgp"))
            .cornerRadius(15.0)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 120)
            }.edgesIgnoringSafeArea(.top)
            
            FooterAddProductToCartView(viewModel: viewmodel,stepperLong: $stepperLong,stepperQty: $stepperQty)
        }
        .edgesIgnoringSafeArea(.bottom)
        
        .toolbar{
            buttonCartView(numberOfProduct: addProductHistoryModel.items.count)
        }
        
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(viewmodel: CartModel(id: 1, productImage: "product3", productName: "ลอคสแน๊ปลอค3", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง","อลูซิงค์"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: ""))
            .environmentObject(AddProductViewModel())
    }
}
