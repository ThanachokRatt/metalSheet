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
    @EnvironmentObject var registerViewModel:RegisterViewModel
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
                .overlay(
                                ZStack {
                                    if registerViewModel.shouldShow{
                                        CustomAlertViewSuccess()
                                            .padding(.top,70)
                                    }
                                })
                
                checkboxView(role: $role).padding()
                
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
              /*  .alert(isPresented: $registerViewModel.showAlert) {
                    
                    Alert(title: Text("Status"),
                          message: Text(registerViewModel.alertMessage),
                          dismissButton: .default(Text("OK")){
                        if registerViewModel.shouldDismiss {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                    )
                }*/
                
                
                
                
            }
        }
        
    }
    struct CustomAlertViewSuccess: View {
        @Environment(\.presentationMode) var presentationMode
   
        @EnvironmentObject  var  registerViewModel: RegisterViewModel
       

     

        var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    Image("removeBgLogo")
                        .resizable()
                        .frame(width: 170, height: 150)
             
                        .font(.system(size: 20))
                      
                   // Text("\(registerViewModel.alertMessage)!")
                    Text("สมัครสมาชิกสำเร็จเรียบร้อย!")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .bold()
                        
                    Button(action: {
                        if registerViewModel.shouldDismiss{
                           
                            presentationMode.wrappedValue.dismiss()
                            registerViewModel.setShouldShow()
                            registerViewModel.setErrorMessage()
                            
                        }
                        
                    }) {
                        Text("กลับสู่หน้าล็อกอิน")
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

struct registerShlefView_Previews: PreviewProvider {
    static var previews: some View {
        registerShlefView().environmentObject(RegisterViewModel())
    }
}
