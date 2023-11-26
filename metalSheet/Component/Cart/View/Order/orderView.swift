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
    @State private var navigationToLocationView : Bool = true
    @State private var userConfirmedOrder: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject  var  orderViewModel: OrderViewModel
    // @EnvironmentObject var navigationStackController: NavigationStackController
    
    @State private var isOrder = false
    @State private var showAlert = false
    @State private var showAlerError = false
    @State private var isEditing = false
    @State private var isaddProductHistoryView = false
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        ScrollView {
            VStack {
                
                if locationViewModel.items.contains(where: { $0.isSelected }) {
                    ForEach(locationViewModel.items.filter { $0.isSelected }) { selectedLocation in
                        NavigationLink(destination: locationShelfView()) {
                            VStack {
                                
                                ListRowView(item: selectedLocation, navigationtoLocationView: $navigationToLocationView)
                                    .overlay(RoundedRectangle(cornerRadius: 10,style: .continuous).stroke(Color.black,lineWidth:  1))
                                    .padding(.horizontal,8)
                                    .padding(.vertical,8)
                            }
                           
                            
                        }
                    }
                } else {
                    NavigationLink(destination: addNewlocationView(isEditing: $isEditing)) {
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
                    ProductHistoryRowView(viewModel: item, isAddProducthistoryView: $isaddProductHistoryView)
                }
                HStack{
                    Text("ราคาสินค้าทั้งหมด")
                    
                    Spacer()
                    Text("฿\(addProductHistoryModel.total).00")
                        
                }.font(.system(size: isiPad ? 27 : 17))
                    .bold()
                    .padding(EdgeInsets(top: 18, leading: 18, bottom: 1, trailing: 18))
                HStack{
                    Text("(ไม่รวมค่าจัดส่ง,ค่ามัดจำ,สกรู)")
                        .font(.system(size: isiPad ? 23 : 13))
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
                Text("\(showAlerError ? "กรุณาเพิ่มที่อยู่" : "")")
                    .foregroundColor(Color.red)
                    .font(.subheadline)
                    .padding(.top,10)
                
                Button {
               
                    if locationViewModel.items.contains(where: { $0.isSelected }) {
                        
                        showAlert = true
                        showAlerError = false
                        
                    }else{
                        showAlerError = true
                   
                    }
                  
                } label: {
                    Text("สั่งซื้อสินค้า")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("lipstick"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    
                }.padding()
                    .disabled(isOrder)
            }
           
        }.background(Color.white)
        
        
            .navigationTitle(Text("สั่งซื้อ"))
            .preferredColorScheme(.light)
           
       
        
            .alert(isPresented: $showAlert) {
                return Alert(
                    title: Text("ต้องการที่จะสั่งซื้อสินค้าหรือไม่?"),
                    message: Text(""),
                    primaryButton: .cancel(Text("ยกเลิก")) {
                       
                    },
                    secondaryButton: .default(Text("ยืนยัน")) {
                        userConfirmedOrder = true
                        isOrder = true
                        var user = OrderModel()
                        var orderItems = [OrderItem]()
                        
                        if let selectedLocation = locationViewModel.items.first(where: { $0.isSelected }) {
                            user.name = ("\(selectedLocation.name)")
                            user.phone = ("\(selectedLocation.phone)")
                            user.address = ("ที่อยู่: \(selectedLocation.addressOne) \(selectedLocation.adressTwo) รหัสไปรษณีย์: \(selectedLocation.postCode) ประเภทที่อยู่: \(selectedLocation.addressType)")
                            user.detail = ("\(addProductHistoryModel.total).00 บาท")
                            
                            
                        }
                        
                        for (id,item) in addProductHistoryModel.items.enumerated() {
                            var orderItem = OrderItem()
                            orderItem.itemId = id + 1
                            orderItem.name = ("\(item.productName)")
                            orderItem.bmt =  ("ความหนา: \(item.selectedCategory) มม.")
                            orderItem.length = ("ความยาว: \(item.selectedLong) ม.")
                            orderItem.color = ("สี: \(item.selectedColorCategory)")
                            orderItem.qty = Int(item.selectedQty) ?? 0
                            orderItem.price = item.calculatedPrice
                            orderItems.append(orderItem)
                            
                        }
                        user.orderList = orderItems
                        
                        
                       
                        orderViewModel.saveOrder(user: user){
                                isOrder = false
                                userConfirmedOrder = false
                            }
                    }
                )
                
            }
           
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
    
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a" // Customize the date format as needed
        return dateFormatter.string(from: Date())
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
                    Text(" กรุณาตรวจสอบอีเมลของท่าน")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                    Text("ทางทีมงานจะติดต่อกลับภายในเร็วๆนี้")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
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
                .padding(.horizontal, 60)
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
