//
//  registerView.swift
//  metalSheet
//
//  Created by Schweppe on 25/8/2566 BE.
//

import SwiftUI

struct registerShlefView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var name = ""
    @State private var phone = ""
    @State private var passwordsMatch = true
    @State private var isPasswordHidden = true
    @State private var isConfirmHidden = true
    @State private var role = "ลูกค้า"
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var registerViewModel = RegisterViewModel()
    @State private var isRegister = false
    
    
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            VStack{
                
                textfieldView(email: $email,
                              password: $password,
                              confirmPassword: $confirmPassword,
                              name: $name,
                              phone: $phone,
                              passwordsMatch: $passwordsMatch,
                              isPasswordHidden: $isPasswordHidden,
                              isConfirmHidden: $isConfirmHidden)
                
                checkboxView(role: $role)
                
                Text(registerViewModel.errorRegisterMessage)
                    .foregroundColor(Color.red)
                    .font(.subheadline)
                if isRegister {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Color.white)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .padding()
                    
                }
                
                Button(action: {
                    
                    var user = RegisterModel()
                    user.email = email
                    user.password = password
                    user.name = name
                    user.phone = phone
                    user.role = role
                    isRegister = true
                    self.registerViewModel.registerUser(user: user){
                        isRegister = false
                    }
                    
                }){
                    registerButtonView()
                }
                .alert(isPresented: $registerViewModel.showAlert) {
                    
                    Alert(title: Text("Status"),
                          message: Text(registerViewModel.alertMessage),
                          dismissButton: .default(Text("OK")){
                        if registerViewModel.shouldDismiss {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    )
                }
                
                
                
                
            }
        }
        
    }
}
struct BackgroundView: View {
    var body: some View {
        
        
        GeometryReader { geometry in
            Circle()
                .fill(Color("red1").opacity(0.4))
            
                .scaleEffect(2)
            
                .offset(y: -geometry.size.height*0.6)
            
            
        }
        GeometryReader { geometry in
            Circle()
                .fill(Color("slgreen").opacity(0.3))
            
                .scaleEffect(2)
            
                .offset(x: -geometry.size.height*0.4)
            
            
        }
        
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerShlefView()
    }
}
