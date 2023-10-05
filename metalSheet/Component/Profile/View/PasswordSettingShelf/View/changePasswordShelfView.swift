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
    
    @ObservedObject private var resetPasswordViewModel = ResetPasswordViewModel()
    
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
            .alert(isPresented: $resetPasswordViewModel.showAlert) {
                Alert(title: Text("Status"),
                      message: Text(resetPasswordViewModel.resetMessage),
                      dismissButton:.default (Text("OK")){
                    if resetPasswordViewModel.shouldDismiss{
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
            }
          
            
     
            
            Spacer()
            
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}

struct changePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        changePasswordShelfView()
            .environmentObject(LoginViewModel())
    }
}
