//
//  addLocationView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct addLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var locationViewModel: LocationViewModel


    @State  var name = ""
    @State  var phoneNumber = ""
    @State  var address1 = ""
    @State var address2 = ""
    @State var postCode = ""
    @State  var selectedAddressType: AddressType? // เก็บประเภทของที่อยู่ที่ถูกเลือก
    @State  var isHomeSelected = false // สถานะการเลือกที่อยู่บ้าน
    @State var isWorkSelected = false // สถานะการเลือกที่อยู่ที่ทำงาน
    @State var addressType = ""
    @State var isSelected = false
    
    //alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    enum AddressType {
            case home
            case work
        }
    
    var body: some View {
        VStack (spacing: 0) {
            Form {
                
                Section(header: Text("ช่องทางการติดต่อ").font(.body)) {
                        TextField("ชื่อจริง-นามสกุล", text: $name)
                        TextField("เบอร์มือถือ", text: $phoneNumber)
                        
                    }
                    Section(header: Text("ที่อยู่").font(.body)) {
                        TextField("จังหวัดม เขต/อำเภอ,แขวง/ตำบล", text: $address1)
                        TextField("บ้านเลขที่,ซอย,หมู่,ถนน", text: $address2)
                        TextField("รหัสไปรษณีย์", text: $postCode)
                    }
                    Section(header: Text("ประเภทที่อยู่").font(.body)) {
                        
                        
                        HStack {
                            Text("เลือกประเภทที่อยู่")
                            Spacer()
                            
                            Text("บ้าน")
                                .padding(.all,8)
                                .background(isHomeSelected ? Color("green123").opacity(0.7) : Color.gray.opacity(0.4))
                                .foregroundColor(isHomeSelected ? .white : .black)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedAddressType = .home
                                    isHomeSelected = true
                                    isWorkSelected = false
                                    addressType = "บ้าน"
                                    print(addressType)
                                }
                                .contentShape(Rectangle()) // Make the button tappable
                            
                            Text("ที่ทำงาน")
                                .padding(.all,8)
                                .background(isWorkSelected ? Color("green123").opacity(0.7) : Color.gray.opacity(0.4))
                                .foregroundColor(isWorkSelected ? .white : .black)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedAddressType = .work
                                    isHomeSelected = false
                                    isWorkSelected = true
                                    addressType = "ที่ทำงาน"
                                    print(addressType)
                                    
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
                    
            }
         
        }.alert(isPresented: $showAlert, content: getAlert)
        
    }
    func Save() {
        if textcheck() {
            if locationViewModel.items.isEmpty {
                        isSelected = true
                    } else {
                        isSelected = false
                    }
            
            locationViewModel.addItem(name: name, phone: phoneNumber, addressOne: address2, addressTwo: address1, postCode: postCode, addressType: addressType,isSelected: isSelected )
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

struct addLocationView_Previews: PreviewProvider {
    static var previews: some View {
        addLocationView().environmentObject(LocationViewModel())
    }
}
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
