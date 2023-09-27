//
//  orderView.swift
//  metalSheet
//
//  Created by Schweppe on 25/9/2566 BE.
//

import SwiftUI

struct orderView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
    var viewModel: CartModel
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
   // @EnvironmentObject var navigationStackController: NavigationStackController
    
    var body: some View {
        ScrollView {
            VStack {
                
                if locationViewModel.items.contains(where: { $0.isSelected }) {
                    ForEach(locationViewModel.items.filter { $0.isSelected }) { selectedLocation in
                        NavigationLink(destination: locationShelfView()) {
                            ListRowView(item: selectedLocation)
                        }
                    }
                } else {
                    NavigationLink(destination: addNewlocationView()) {
                        HStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color(.black))
                                .frame(width: 20,height: 40)
                            Text("เพิ่มที่อยู่ใหม่")
                                .padding()
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .frame(maxWidth: .infinity)
                        .background(Color(.white))
                        .foregroundColor(.white)
                        .cornerRadius(20) // Adjust horizontal padding
                        
                        .overlay(RoundedRectangle(cornerRadius: 20,style: .continuous).stroke(Color.black,lineWidth:  1))
                        .padding()
                    }
                }
                ForEach(addProductHistoryModel.items, id:\.id){
                    item in
                    ProductHistoryRowView(viewModel: item)
                    }
                HStack{
                    Text("ราคาสินค้าทั้งหมด").bold()
                  
                    Spacer()
                    Text("฿\(addProductHistoryModel.total).00")
                        .bold()
                }.padding(EdgeInsets(top: 18, leading: 18, bottom: 1, trailing: 18))
                HStack{
                    Text("(ไม่รวมค่าจัดส่ง,ค่ามัดจำ,สกรู)")
                        .font(.system(size: 13))
                        .foregroundColor(.red)
                  
                    Spacer()
                   
                }.padding(.horizontal,15)
                
                    Button {
                    showingAlert = true
                    } label: {
                        Text("สั่งซื้อสินค้า")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("lipstick"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                          
                            
                    }.padding()
                
                
                    
                }
            }
            
        .navigationTitle(Text("สั่งซื้อ"))
        .alert(isPresented: $showingAlert) {
            if locationViewModel.items.contains(where: { $0.isSelected }) {
                // Alert for selected location
                return Alert(
                    title: Text("สั่งซื้อสินค้าสำเร็จ"),
                    message: Text("   กรุณารอเจ้าหน้าที่ติดต่อกลับผ่านทางอีเมลหรือทางเบอร์โทรศัพท์ขอบคุณที่ใช้บริการ"),
                    dismissButton: .default(Text("ตกลง")){
                        addProductHistoryModel.removeAllItems()
                        presentationMode.wrappedValue.dismiss()
                        
                    //  navigationStackController.resetNavigationStack()
                    }
                )
            } else {
                // Alert for no selected location
                return Alert(
                    title: Text("กรุณาเพิ่มที่อยู่"),
                    dismissButton: .default(Text("ตกลง"))
                )
            }
        }
       
    }
    }
    
    struct orderView_Previews: PreviewProvider {
        static var previews: some View {
            orderView(viewModel: CartModel(productImage: "product1", productName: "ลอคสแน๊ปลอค", description: "เมทัลชีท 5 สันลอนรูปแบบทันสมัย สามารถติดตั้งแบบซ่อนสกรูได้ทำให้งานเนียนไม่รำคาญตา สามารถรีดความยาวได้ตามความต้องการ ", categories: ["0.20" ,"0.23","0.35","0.40","0.47"], priceNocolor: 56, priceColor: 63, colorCategories: ["ดำ","น้ำเงิน","ขาว","น้ำตาล","ชมพู","แดง","เหลือง"],currentPrice: 0,selectedCategory: "",selectedColorCategory: "",selectedLong: "", selectedQty: ""))
                .environmentObject(LocationViewModel())
                .environmentObject(AddProductViewModel())
        }
    }

