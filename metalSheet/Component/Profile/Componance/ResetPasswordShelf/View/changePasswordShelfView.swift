//
//  changePasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct changePasswordShelfView: View {
    @State private var password = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var isPasswordHidden = true
    @State private var isConfirmHidden = true
    @State private var isnewPasswordHidden = true
    @State private var resetpasswordsMatch = true
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @EnvironmentObject var resetPasswordViewModel:ResetPasswordViewModel
    
    @State private var isRegister = false
  
    var body: some View {
        VStack (spacing: 15) {
            headerPasswordView()
            
            textfieldPasswordView(password: $password,
                                  newPassword: $newPassword,
                                  confirmPassword: $confirmPassword,
                                  isPasswordHidden: $isPasswordHidden,
                                  isnewPasswordHidden: $isnewPasswordHidden,
                                  isConfirmHidden: $isConfirmHidden,
                                  resetpasswordsMatch: $resetpasswordsMatch)
           
            if isRegister {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .background(Color.white)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding()
                
            }
            
            Button(action: {
                var user = ResetPasswordModel()
                user.email = loginViewModel.email
                user.newPassword = newPassword
                isRegister = true
                self.resetPasswordViewModel.resetPassword(user: user){
                    isRegister = false
                }
                
            }) {
                saveInfoPasswordView()
            }
            .overlay(
                ZStack {
                    if resetPasswordViewModel.showAlert{
                        CustomAlertView3(alertMessage:resetPasswordViewModel.resetMessage, newPassword: newPassword)
                            .padding(.bottom,270)
                           
                    }
                })
          
            
     
            
            Spacer()
            
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
    struct CustomAlertView3: View {
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject var resetPasswordViewModel: ResetPasswordViewModel
        var alertMessage: String
        @EnvironmentObject var loginViewModel: LoginViewModel
        
        var newPassword: String
        @State private var isLogin = false

        var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    Image("removeBgLogo")
                        .resizable()
                        .frame(width: 170, height: 150)
                    //Text(alertMessage)
                    Text("เปลี่ยนรหัสผ่านสำเร็จ!")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                    if  isLogin  {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .background(Color.white)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    Text("กรุณากลับสู่หน้าการตั้งค่าใหม่อีกครั้ง")
                        .foregroundColor(.black)
                    Button(action: {
                        if resetPasswordViewModel.shouldDismiss{
                            var user = LoginModel()
                            user.email = loginViewModel.email
                            user.password = newPassword
                            
                            isLogin = true
                            self.loginViewModel.loginUser(user: user) {
                                isLogin = false
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                            resetPasswordViewModel.setShowAlertResetPassword()
                        
                        }
                        
                    }) {
                        Text("กลับสู่การตั้งค่า")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(Color("lipstick"))
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

