//
//  PersonalButton.swift
//  metalSheet
//
//  Created by Schweppe on 12/10/2566 BE.
//

import SwiftUI
struct PersonalButton: View {
    @Binding var isEditingEnabled: Bool // Added binding
    @Binding var name: String
    @Binding var phone: String
    @Binding var errorMessage: String
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var personalViewModel: PersonalViewModel
    @State private var isRegister = false
    
    
    var body: some View {
        VStack {
            if isRegister {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .background(Color.white)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding()
                
            }
            Button {
                Save()
            } label: {
                Text(isEditingEnabled ? "บันทึกข้อมูล" : "แก้ไขข้อมูล") // Change button label based on editing status
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("lipstick"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding()
               
        } .overlay(
            ZStack {
                if personalViewModel.shouldShow {
                    CustomAlertView2(alertMessage: personalViewModel.alertMessage)
                        .padding(.bottom,270)
                }
            })
    }
    
    func Save() {
        if isEditingEnabled {
            // Save data here
            if name.isEmpty {
                errorMessage = "กรุณากรอกชื่อ"
            } else if phone.isEmpty {
                errorMessage = "กรุณากรอกเบอร์มือถือ"
            } else {
                errorMessage = "" // Clear any previous error message
                var user = PersonalModel()
                user.name = name
                user.phone = phone
                isRegister = true
                self.personalViewModel.updateUser(user: user){
                    isRegister = false
                }
             
            }
        } else {
            isEditingEnabled = true
        }
    }
    
    struct CustomAlertView2: View {
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject var personalViewModel: PersonalViewModel
        var alertMessage: String
        @EnvironmentObject var loginViewModel: LoginViewModel
    
        @State private var isLoginAgain = false

        var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    Image("removeBgLogo")
                        .resizable()
                        .frame(width: 160, height: 140)
                    //Text(alertMessage)
                    Text("บันทึกข้อมูลส่วนตัวสำเร็จ!")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.black)
                    Text("กรุณากลับสู่หน้าการตั้งค่าเพื่อดูข้อมูลที่บันทึก")
                        .foregroundColor(.black)
                    if isLoginAgain {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .background(Color.white)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                    Button(action: {
                        if personalViewModel.shouldDismiss{
                         
                            personalViewModel.setShowAlert()
                            
                           var user = LoginModel()
                            user.email = loginViewModel.email
                            user.password = loginViewModel.passWord
                            isLoginAgain = true
                            
                            self.loginViewModel.loginUser(user: user){
                                isLoginAgain = false
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                           
                                            }
                    }) {
                        Text("กลับสู่หน้าการตั้งค่า")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 30)
                            .background(Color("greenLogo"))
                            .clipShape(Capsule())
                    }
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 30)
                .background(BlurView())
                .cornerRadius(25)
            }
          
            
        }
    }
    
    
}



