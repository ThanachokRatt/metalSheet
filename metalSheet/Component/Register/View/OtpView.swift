//
//  OtpView.swift
//  metalSheet
//
//  Created by Schweppe on 5/11/2566 BE.
//

import SwiftUI

struct OtpView: View {
    @State var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    @EnvironmentObject var otpViewModel: OtpViewModel
    @EnvironmentObject var registerViewModel:RegisterViewModel
    @State private var isRegister = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isGoToLogin = false
    var body: some View {
        VStack{
            Image("removeTextLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("ใส่รหัส OTP")
                .foregroundColor(.black).opacity(1)
                .font(.system(size:25))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 15)
            Text("ส่งรหัส 6 หลักไปที่ \(otpViewModel.email)")
                .foregroundColor(.black).opacity(0.5)
                .font(.system(size:15))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 18)
                .padding(.top,1)
            
            HStack(spacing: 15){
                ForEach(0..<6 ,id: \.self){index in
                    OTPText(index)
                    
                }
            }
            .background(content:{
                TextField("",text:$otpText.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1,height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.bottom,20)
            .padding(.top,10)
            
            Text(registerViewModel.errorRegisterMessage)
                .foregroundColor(Color.red)
                .font(.subheadline)
            
            CooldwonOtp()
            if isRegister {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .background(Color.white)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding()
                
            }
            
            Button{
                otpViewModel.userOtp = "\(otpText)"
                print(otpViewModel.userOtp )
                print(otpViewModel.email)
                print(otpViewModel.name)
                print(otpViewModel.password)
                print(otpViewModel.role)
                print(otpViewModel.phone)
                print(otpViewModel.verifyOtp)
                
                var user = RegisterModel()
                user.email = otpViewModel.email
                user.password = otpViewModel.password
                user.name = otpViewModel.name
                user.phone = otpViewModel.phone
                user.role = otpViewModel.role
                user.code = otpViewModel.userOtp
                isRegister = true
                
                self.registerViewModel.registerUser(user: user) {
                    isRegister = false
                   
                }
                registerViewModel.setErrorMessage()
                
                
            } label: {
                Text("ถัดไป")
                    .fontWeight(.bold)
                    .padding(.vertical,12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background{
                        RoundedRectangle(cornerRadius: 6,style: .continuous).fill(.black)
                    }
                
            }
            .disableWithOPacity(otpText.count < 6)
        }
        .padding(.all)
        .frame(maxHeight: .infinity,alignment: .top)
        .toolbar{
            ToolbarItem(placement: .keyboard){
                Button("เสร็จสิ้น"){
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth:.infinity,alignment: .trailing)
            }
        }
        .overlay(
              ZStack {
                  if registerViewModel.shouldShow{
                      CustomAlertViewSuccess(goToLogin: $isGoToLogin)
                          .padding(.top,30)
                          .padding(.horizontal,5)
                  }
              })
        .background(
            // Use NavigationLink to navigate to OtpView when redirectToOtpView is true
            NavigationLink("", destination: loginShelfView().navigationBarTitleDisplayMode(.inline).navigationBarHidden(true), isActive: $isGoToLogin)
        )
    }
    @ViewBuilder
    func OTPText(_ index: Int)-> some View{
        ZStack{
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex,offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            }else{
                Text("")
            }
        }
        
        .frame(width: 45, height: 55)
        .background{
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6,style: .continuous)
                .stroke(status ? .black : .gray,lineWidth:  status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: status)

        }
        
    }
    
    struct CustomAlertViewSuccess: View {
        @Environment(\.presentationMode) var presentationMode
        @Binding var goToLogin: Bool
        @EnvironmentObject  var  registerViewModel: RegisterViewModel
       

     

        var body: some View {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25) {
                    Image("removeBgLogo")
                        .resizable()
                        .frame(width: 160, height: 140)
             
                        .font(.system(size: 20))
                      
                   // Text("\(registerViewModel.alertMessage)!")
                    Text("สมัครสมาชิกสำเร็จเรียบร้อย!")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .bold()
                    Text(" กรุณากลับสู่หน้าล็อกอินเพื่อเข้าสู่ระบบ")
                        .foregroundColor(.black)
                        
                    Button(action: {
                        if registerViewModel.shouldDismiss{
                           
                            goToLogin = true
                            
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

#Preview {
    OtpView()
        .environmentObject(RegisterViewModel())
        .environmentObject(OtpViewModel())
}

//MARK: - View Extensions

extension View{
    func disableWithOPacity(_ condition: Bool)->some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}
//MARK: - Bindind string extension
extension Binding where Value == String{
    func limit(_ lenght: Int)-> Self{
        if self.wrappedValue.count > lenght{
            DispatchQueue.main.async{
                self.wrappedValue = String(self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }
}
