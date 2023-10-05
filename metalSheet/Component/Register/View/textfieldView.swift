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
    @State private var isEmailValid = true
    @ObservedObject private var registerViewModel = RegisterViewModel()
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    var body: some View {
        
        VStack(spacing: 15) {
            VStack {
                Text("Create \nAccount")
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
                        Text("Email")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("Email",text:  $email,onEditingChanged: {_ in
                        isEmailValid = isValidEmail(email)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    if !isEmailValid{
                        Text("Please enter a correct email format.")
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
                        Text("Password")
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    if isPasswordHidden {
                        SecureField("Password", text: self.$password)
                    }else{
                        TextField("Password", text: self.$password)
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
                        TextField("Password", text: self.$confirmPassword)
                    }
                }
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: confirmPassword) { newValue in
                    passwordsMatch = newValue == password
                }
            if !passwordsMatch{
                Text("Please enter a matching password.")
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
            
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(Color(.black))
                        Text("Full-Name")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("Full-Name",text:  $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                
                
            }
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "phone")
                            .foregroundColor(Color(.black))
                        Text("Phone")
                        
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("Phone",text:  $phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
          
            }
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}

struct textfieldView_Previews: PreviewProvider {
    static var previews: some View {
        registerShlefView()
    }
}

