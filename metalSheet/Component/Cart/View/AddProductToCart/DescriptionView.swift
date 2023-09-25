//
//  DescriptionView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI

struct DescriptionView: View {
    
    
    @State private var selectedIndex: Int = 2
    @State var stepperLong: Int = 1
    @State var stepperQty: Int = 1
    var viewModel: CartModel
    
    @EnvironmentObject var addProductHistoryModel: AddProductViewModel
    
    var isCategoryEnabled: Bool {
        return viewModel.categories[selectedIndex] == "0.35"
    }
    
    

    var body: some View {
        ZStack {
            Color("Bgp")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Image(viewModel.productImage)
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                
                VStack (alignment: .leading,spacing: 10){
                    Text(viewModel.productName)
                        .font(.title)
                        .fontWeight(.bold)
                    HStack {
                        Text("฿\(isCategoryEnabled ? viewModel.priceColor : viewModel.priceNocolor) ")
                            .font(.title)
                        
                        Text("(ราคาต่อเมตร)")
                            .font(.subheadline)
                            .padding(.bottom,-5)
                    }
                       
                       
                    Text("(สามารถเลือกสีได้เฉพาะความหนา 0.35มิลลิเมตร)")
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .font(.system(size: 15))
                    
                    Text("รายละเอียด")
                        .fontWeight(.medium)
                        
                        .padding(.vertical, 8)
                    
                    Text(viewModel.description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                   
                    HStack (alignment: .top){
                        VStack(alignment: .leading) {
                            Text("ความหนา(มิลลิเมตร)")
                            
                                .fontWeight(.semibold)
                                .padding(.bottom,4)
                            
                            HStack{
                                ForEach(0 ..< viewModel
                                    .categories.count) { i in
                                        CategoryView(isActive: i == selectedIndex, text: viewModel.categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                            addProductHistoryModel.updateisCategoryEnabled(isCategoryEnabled)
                                            addProductHistoryModel.updateSelectedCategory(viewModel.categories[i])
                                            if viewModel
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
                    
                    ColorDotCategoryView(colorCategories: viewModel.colorCategories, isCategoryEnabled: isCategoryEnabled)
                    
                    
                    HStack(alignment: .bottom) {
                        Stepper("ความยาว \(stepperLong) (เมตร)",value: $stepperLong,in: 1...22)
                            .padding(.top,10)
                        
                    }.onChange(of: stepperLong) { newValue in
                        // Print the updated value when the stepper value changes
                        var stepperlong = ""
                        stepperlong = "\(newValue)"
                        addProductHistoryModel.updateSelectedLong(stepperlong)
                        print("Stepper value: \(newValue)")
                    }
          
                    
                    HStack(alignment: .bottom){
                        Stepper("จำนวน \(stepperQty) (ชิ้น)",value: $stepperQty,in: 1...100)
                            .padding(.top,10)
                    }.onChange(of: stepperQty) { newValue in
                        // Print the updated value when the stepper value changes
                        var stepperQty = ""
                        stepperQty = "\(newValue)"
                        addProductHistoryModel.updateSelectedQty(stepperQty)
                        print("Stepper value2: \(newValue)")
                    }
                    
                 
                }
                .padding()
                .background(Color("Bgp"))
            .cornerRadius(15.0)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 120)
            }.edgesIgnoringSafeArea(.top)
            FooterAddProductToCartView(viewModel: viewModel,stepperLong: $stepperLong,stepperQty: $stepperQty)
        }
        .edgesIgnoringSafeArea(.bottom)
        
        .toolbar{
            buttonCartView(numberOfProduct: addProductHistoryModel.items.count)
        }
        
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(viewModel: CartModel(productImage: "product3", productName: "ลอคสแน๊ปลอค3", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: ""))
            .environmentObject(AddProductViewModel())
    }
}
/*import SwiftUI

struct DescriptionView: View {
    
    @State private var selectedIndex: Int = 2
    @State var stepperLong: Int = 1
    @State var stepperQty: Int = 1
    @State private var isFullScreenPresented = false
    var viewModel: CartModel
    
    var isCategoryEnabled: Bool {
        return viewModel.categories[selectedIndex] == "0.35"
    }
    
    

    var body: some View {
        ZStack {
            Color("Bgp")
                .edgesIgnoringSafeArea(.all)
            ButtonBackView()
                .zIndex(1)
            
            ScrollView {
                
                Image(viewModel.productImage)
                    .resizable()
                
                    .aspectRatio(contentMode: .fit)
                   
                
                
                VStack (alignment: .leading,spacing: 10){
                    Text(viewModel.productName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("(สามารถเลือกสีได้เฉพาะความหนา 0.35มิลลิเมตร)")
                        .foregroundColor(.red)
                        .opacity(0.8)
                        .font(.system(size: 15))
                    
                    Text("รายละเอียด")
                        .fontWeight(.medium)
                        
                        .padding(.vertical, 8)
                    
                    Text(viewModel.description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                   
                    HStack (alignment: .top){
                        VStack(alignment: .leading) {
                            Text("ความหนา(มิลลิเมตร)")
                            
                                .fontWeight(.semibold)
                                .padding(.bottom,4)
                            
                            HStack{
                                ForEach(0 ..< viewModel
                                    .categories.count) { i in
                                        CategoryView(isActive: i == selectedIndex, text: viewModel.categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                        }
                        .frame(maxWidth:.infinity, alignment: .leading)
                        
                        
                    }
                    .padding(.vertical)
                    
                    ColorDotCategoryView(colorCategories: viewModel.colorCategories, isCategoryEnabled: isCategoryEnabled)
                    
                    
                    HStack(alignment: .bottom) {
                        Stepper("ความยาว \(stepperLong) (เมตร)",value: $stepperLong,in: 1...15)
                            .padding(.top,10)
                    }
          
                    
                    HStack(alignment: .bottom){
                        Stepper("จำนวน \(stepperQty) (ชิ้น)",value: $stepperQty,in: 1...100)
                            .padding(.top,10)
                    }
                    
                 
                }
                .padding()
                .background(Color("Bgp"))
            .cornerRadius(15.0)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 120)
            }.edgesIgnoringSafeArea(.top)
            
            
                    
                
                   
            
            FooterAddProductToCartView(priceNoColor: viewModel.priceNocolor, priceColor: viewModel.priceColor, isCategoryEnabled: isCategoryEnabled)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(viewModel: CartModel(productImage: "product3", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","เทา","แดง","เหลือง"]))
    }
}*/




