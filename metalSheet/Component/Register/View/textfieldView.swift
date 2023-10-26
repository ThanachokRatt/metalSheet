//
//  textfieldView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct textfieldView: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var name: String
    @Binding var phone: String
    @Binding var passwordsMatch: Bool
    @Binding var isPasswordHidden: Bool
    @Binding var isConfirmHidden: Bool
    @Binding var isEmailValid : Bool
    @Binding var showEmailError : Bool
  

    @ObservedObject private var registerViewModel = RegisterViewModel()
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var body: some View {
        
        VStack(spacing: 15) {
            VStack {
                Text("สมัครสมาชิก")
                    .foregroundColor(.black).opacity(0.8)
                    .font(.system(size:45))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,20)
            }.padding(.bottom,40)
            
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "envelope")
                            .foregroundColor(Color(.black))
                        Text("อีเมล")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                    TextField("อีเมล", text: $email, onEditingChanged: { isEditing in
                        if !isEditing {
                            isEmailValid = isValidEmail(email)
                            showEmailError = !isEmailValid
                        }
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                    if showEmailError {
                        
                        Text("กรุณากรอกรูปแบบอีเมลที่ถูกต้อง")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.leading, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                
                
            }
            
            
            HStack (spacing: 22){
                VStack (spacing:10){
                    
                    HStack(spacing: 5) {
                        Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                            .foregroundColor(Color(.black))
                            .onTapGesture {
                                isPasswordHidden.toggle()
                                
                            }
                        Text("รหัสผ่าน")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isPasswordHidden {
                        SecureField("รหัสผ่าน", text: self.$password)
                    }else{
                        TextField("รหัสผ่าน", text: self.$password)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack (spacing: 22){
                VStack (spacing:10){
                    
                    HStack(spacing: 5) {
                        Image(systemName: isConfirmHidden ? "eye.slash" : "eye")
                            .foregroundColor(Color(.black))
                            .onTapGesture {
                                isConfirmHidden.toggle()
                                
                            }
                        Text("ยืนยันรหัสผ่าน")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isConfirmHidden {
                        SecureField("ยืนยันรหัสผ่าน", text: self.$confirmPassword)
                    }else{
                        TextField("ยืนยันรหัสผ่าน", text: self.$confirmPassword)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: confirmPassword) { newValue in
                    passwordsMatch = newValue == password
                }
            if !passwordsMatch{
                Text("โปรดกรอกข้อมูลให้ตรงกับรหัสผ่าน")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(Color(.black))
                        Text("ชื่อจริง-นามสกุล")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("ชื่อจริง-นามสกุล",text:  $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                
                
            }
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "phone")
                            .foregroundColor(Color(.black))
                        Text("เบอร์มือถือ")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("เบอร์มือถือ",text:  $phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
          
            }
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}


