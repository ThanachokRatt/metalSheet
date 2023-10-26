//
//  orderView.swift
//  metalSheet
//
//  Created by Schweppe on 25/9/2566 BE.
//

import SwiftUI
import NukeUI

struct orderView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
    var viewModel: CartModel

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject  var  orderViewModel: OrderViewModel
   // @EnvironmentObject var navigationStackController: NavigationStackController
  
    @State private var isOrder = false
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
                                .frame(width: 20,height: 20)
                          
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
                   
                if isOrder {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Color.white)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding()
                    
                }
                    Button {
                        var user = OrderModel()
                        var orderItems = [OrderItem]()
                        
                        if let selectedLocation = locationViewModel.items.first(where: { $0.isSelected }) {
                            user.name = ("\(selectedLocation.name)")
                            user.phone = ("\(selectedLocation.phone)")
                            user.address = ("ที่อยู่: \(selectedLocation.addressOne) \(selectedLocation.adressTwo) รหัสไปรษณีย์: \(selectedLocation.postCode) ประเภทที่อยู่: \(selectedLocation.addressType)")
                            user.detail = ("ยอดรวมคำสั่งซื้อ: \(addProductHistoryModel.total).00 บาท")
                            
                           
                          }
                        
                        for (_,item) in addProductHistoryModel.items.enumerated() {
                            var orderItem = OrderItem()
                            orderItem.itemId = item.id
                            orderItem.bmt =  ("ความหนา: \(item.selectedCategory)มม.")
                            orderItem.length = ("ความยาว: \(item.selectedLong) ม.")
                            orderItem.color = ("สี: \(item.selectedColorCategory)")
                            orderItem.qty = Int(item.selectedQty) ?? 0
                            orderItem.price = item.calculatedPrice
                            orderItems.append(orderItem)
                           
                        }
                        user.orderList = orderItems
                        isOrder = true
                        orderViewModel.saveOrder(user: user){
                            isOrder = false
                        }
                        
                        
                    } label: {
                        Text("สั่งซื้อสินค้า")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("lipstick"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                          
                        
                    }.padding()
            }
        }.background(Color.white)
       
        .navigationTitle(Text("สั่งซื้อ"))
        .overlay(
                        ZStack {
                            if orderViewModel.showAlert2{
                                CustomAlertViewSuccessOrder()
                                    .padding(.top,-10)
                            }
                        })
        
     /*   .alert(isPresented: $orderViewModel.showAlert) {
            if locationViewModel.items.contains(where: { $0.isSelected }) {
 
                return Alert(
                    title: Text("Status"),
                    message: Text("\(orderViewModel.alertMessage)"),
                    dismissButton: .default(Text("Back to Cart")){
                        if orderViewModel.shouldDismiss{
                            addProductHistoryModel.removeAllItems()
                            presentationMode.wrappedValue.dismiss()
                        }
                  
                    }
                )
            } else {
         
                return Alert(
                    title: Text("กรุณาเพิ่มที่อยู่"),
                    dismissButton: .default(Text("ตกลง"))
                )
            }
        } .background(BlurView())*/
       
    }
    struct CustomAlertViewSuccessOrder: View {
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject  var addProductHistoryModel: AddProductViewModel
        @EnvironmentObject  var  orderViewModel: OrderViewModel
       

     

        var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    Image("removeBgLogo")
                        .resizable()
                        .frame(width: 170, height: 150)
             
                        .font(.system(size: 24))
                        .foregroundColor(.pink)
                    Text("บันทึกคำสั่งซื้อสำเร็จ!")
                        .bold()
                        .font(.system(size: 27))
                        .foregroundColor(.black)
                    Text(" ทางเราได้รับคำสั่งซื้อเรียบร้อยแล้ว")
                        .foregroundColor(.black)
                    Text(" กรุณารอทางทีมงานติดต่อกลับเร็วๆนี้ด้วยค่ะ")
                        .foregroundColor(.black)
                        .padding(.top,-15)
                        
                    Button(action: {
                        if orderViewModel.shouldDismiss{
                            addProductHistoryModel.removeAllItems()
                            presentationMode.wrappedValue.dismiss()
                            orderViewModel.setShowAlert2()
                            
                        }
                        
                    }) {
                        Text("กลับสู่ตะกร้า")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(Color("greenLogo"))
                            .clipShape(Capsule())
                    }
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .background(BlurView())
                .cornerRadius(25)
            }
          
            
        }
    }
    
}
    
  /*  .overlay(
        ZStack {
            if locationViewModel.items.contains(where: { $0.isSelected }) {
                if orderViewModel.showAlert2 {
                    CustomAlertViewSuccess()
                        .padding(.bottom, 270)
                }
            } else if isAlertFailVisible { // Show the CustomAlertViewFail
                CustomAlertViewFail(isAlertFailVisible: $isAlertFailVisible)
                    .padding(.bottom, 270)
            }
        }
    )*/
