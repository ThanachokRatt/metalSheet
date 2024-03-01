//
//  addLocationView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct addLocationView: View {
    var locationItem: LocationItemModel?
    @Binding var isEditing: Bool
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var locationViewModel: LocationViewModel


    @State var name = ""
    @State var phoneNumber = ""
    @State var address1 = ""
    @State var address2 = ""
    @State var postCode = ""
    @State var selectedAddressType: AddressType? // เก็บประเภทของที่อยู่ที่ถูกเลือก
    @State var isHomeSelected = true // สถานะการเลือกที่อยู่บ้าน
    @State var isWorkSelected = false // สถานะการเลือกที่อยู่ที่ทำงาน
    @State var addressType = "บ้าน"
    @State var isSelected = false
	@State var locationLink = ""
	
    //alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    enum AddressType {
            case home
            case work
        }
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack (spacing: 0) {
            Form {
                
                Section(header: Text("ช่องทางการติดต่อ").font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))) {
                        TextField("ชื่อจริง-นามสกุล", text: $name)
                        TextField("เบอร์มือถือ", text: $phoneNumber)
                        .keyboardType(.numberPad)
                       
                        
                    }.font(Font.custom("Pridi-Light",size: isiPad ? 26 : 16))
                    Section(header: Text("ที่อยู่").font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))) {
                        TextField("จังหวัดม เขต/อำเภอ,แขวง/ตำบล", text: $address1)
                        TextField("บ้านเลขที่,ซอย,หมู่,ถนน", text: $address2)
                        TextField("รหัสไปรษณีย์", text: $postCode)
                            .keyboardType(.numberPad)
						TextField("ลิ้งค์ที่อยู่ Google Map (ไม่บังคับ)",text: $locationLink)
                        
                    }.font(Font.custom("Pridi-Light",size: isiPad ? 26 : 16))
                    Section(header: Text("ประเภทที่อยู่").font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))) {
                        
                        
                        HStack {
                            Text("เลือกประเภทที่อยู่")
                                .font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))
                            Spacer()
                            
                            Text("บ้าน")
                                .padding(.all,8)
                                .background(isHomeSelected ? Color("green123").opacity(0.7) : Color.gray.opacity(0.4))
                                .foregroundColor(isHomeSelected ? .white : .black)
                                .font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedAddressType = .home
                                    isHomeSelected = true
                                    isWorkSelected = false
                                    addressType = "บ้าน"
                                  //  print(addressType)
                                }
                                .contentShape(Rectangle()) // Make the button tappable
                            
                            Text("ที่ทำงาน")
                                .padding(.all,8)
                                .background(isWorkSelected ? Color("green123").opacity(0.7) : Color.gray.opacity(0.4))
                                .foregroundColor(isWorkSelected ? .white : .black)
                                .font(Font.custom("Pridi-Regular",size: isiPad ? 26 : 16))
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedAddressType = .work
                                    isHomeSelected = false
                                    isWorkSelected = true
                                    addressType = "ที่ทำงาน"
                                  //  print(addressType)
                                    
                                }
                                .contentShape(Rectangle()) // Make the button tappable
                            
                        }
                        Button {
                            Save()
                        } label: {
                            Text("บันทึกข้อมูล")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("lipstick"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                              
                                
                        }
                    
                    }
                    .onAppear {
                                if let locationItem = locationItem {
                                    // Pre-fill the form with existing data
                                    name = locationItem.name
                                    phoneNumber = locationItem.phone
                                    address1 = locationItem.addressOne
                                    address2 = locationItem.adressTwo
                                    postCode = locationItem.postCode
									locationLink = locationItem.locationLink
                                    addressType = locationItem.addressType
                                    
                                    if locationItem.addressType == "บ้าน" {
                                               isHomeSelected = true
                                               isWorkSelected = false
                                           } else {
                                               isHomeSelected = false
                                               isWorkSelected = true
                                           }
                                    
                                }
                            }
                            .alert(isPresented: $showAlert, content: getAlert)
                    
            } .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button(action: {
                                           hideKeyboard()
                                       }) {
                                           Text("สำเร็จ")
                                               .foregroundColor(Color.red)
                                               .font(Font.custom("Pridi-Regular",size: isiPad ? 22 : 16))
                                               .padding(.horizontal)
                                       }
                    }
                }
            }
         
        }.alert(isPresented: $showAlert, content: getAlert)
        
    }
    func Save() {
        if textcheck() {
            if let locationItem = locationItem {
                // If locationItem is not nil, it means editing an existing item
                locationViewModel.updateItemAtIndex(
                    index: locationViewModel.items.firstIndex(where: { $0.id == locationItem.id }) ?? 0,
                    name: name,
                    phone: phoneNumber,
                    addressOne: address2,
                    addressTwo: address1,
					postCode: postCode, 
					locationLink: locationLink,
                    addressType: addressType,
                    isSelected: isSelected
                )
            } else {
                // If locationItem is nil, it means  adding a new item
                if locationViewModel.items.isEmpty {
                    isSelected = true
                }else {
                    isSelected = false
                }
				locationViewModel.addItem(name: name, phone: phoneNumber, addressOne: address2, addressTwo: address1, postCode: postCode, locationLink: locationLink, addressType: addressType, isSelected: isSelected )
            }
            presentationMode.wrappedValue.dismiss()
        }
    }

    
    func textcheck() -> Bool {
        if name.isEmpty  || phoneNumber.isEmpty || address1.isEmpty || address2.isEmpty || postCode.isEmpty || addressType.isEmpty {
            alertTitle = "กรุณากรอกข้อมูลทุกช่อง"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
       
        return Alert(title: Text(alertTitle))
    }
    
    
}


extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
