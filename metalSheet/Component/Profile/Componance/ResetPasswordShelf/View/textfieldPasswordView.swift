//
//  textfieldPasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct textfieldPasswordView: View {
    @Binding  var password: String
    @Binding  var newPassword: String
    @Binding  var confirmPassword: String
    
    @Binding  var isPasswordHidden: Bool
    @Binding  var isnewPasswordHidden: Bool
    @Binding var isConfirmHidden: Bool
    @Binding var resetpasswordsMatch: Bool
    

    var body: some View {
        VStack(spacing: 10){
            
            HStack (spacing: 22){
                VStack (spacing:10){
                    
                    HStack(spacing: 5) {
                        Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                            .foregroundColor(Color(.black))
                            .onTapGesture {
                                isPasswordHidden.toggle()
                                
                            }
                        Text("รหัสผ่านปัจจุบัน")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isPasswordHidden {
                        SecureField("รหัสผ่านปัจจุบัน", text: self.$password)
                    }else{
                        TextField("รหัสผ่านปัจจุบัน", text: self.$password)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack (spacing: 22){
                VStack (spacing:10){
                    
                    HStack(spacing: 5) {
                        Image(systemName: isnewPasswordHidden ? "eye.slash" : "eye")
                            .foregroundColor(Color(.black))
                            .onTapGesture {
                                isnewPasswordHidden.toggle()
                                
                            }
                        Text("รหัสผ่านใหม่")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isnewPasswordHidden {
                        SecureField("รหัสผ่านใหม่", text: self.$newPassword)
                    }else{
                        TextField("รหัสผ่านใหม่", text: self.$newPassword)
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
                        Text("ยืนยันรหัสผ่านใหม่")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isConfirmHidden {
                        SecureField("ยืนยันรหัสผ่านใหม่", text: self.$confirmPassword)
                    }else{
                        TextField("ยืนยันรหัสผ่านใหม่", text: self.$confirmPassword)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: confirmPassword){
                    newValue in resetpasswordsMatch = newValue == newPassword
                }
            if !resetpasswordsMatch{
                Text("โปรดกรอกข้อมูลให้ตรงกับรหัสผ่านใหม่")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
           
            
        }
        
    }
 

}
