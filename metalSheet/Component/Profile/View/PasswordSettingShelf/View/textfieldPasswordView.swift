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
                        Text("Current Password")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isPasswordHidden {
                        SecureField("Current Password", text: self.$password)
                    }else{
                        TextField("Current Password", text: self.$password)
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
                        Text("New Password")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isnewPasswordHidden {
                        SecureField("New Password", text: self.$newPassword)
                    }else{
                        TextField("New Password", text: self.$newPassword)
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
                        Text("Confirm Password")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isConfirmHidden {
                        SecureField("Confirm Password", text: self.$confirmPassword)
                    }else{
                        TextField("Confirm Password", text: self.$confirmPassword)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: confirmPassword){
                    newValue in resetpasswordsMatch = newValue == newPassword
                }
            if !resetpasswordsMatch{
                Text("Please enter a matching password.")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
           
            
        }
        
    }
 

}
