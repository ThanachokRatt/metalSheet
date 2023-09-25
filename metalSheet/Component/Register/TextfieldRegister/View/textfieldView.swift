//
//  textfieldView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct textfieldView: View {
  
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var name = ""
    @State private var sureName = ""
    @State private var phone = ""
    
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
                Image(systemName: "envelope")
                    .foregroundColor(Color(.black))
                TextField("Email",text:  $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack (spacing: 22){
                Image(systemName: "eye.slash")
                    .foregroundColor(Color(.black))
                
                SecureField("Password", text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack  (spacing: 22){
                Image(systemName: "eye.slash")
                    .foregroundColor(Color(.black))
                
                SecureField("Confirm Password", text: $confirmPassword)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            HStack  (spacing: 22){
                Image(systemName: "person.text.rectangle")
                    .foregroundColor(Color(.black))
                TextField("Full-Name",text:  $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack  (spacing: 22){
                Image(systemName: "phone")
                    .foregroundColor(Color(.black))
                TextField("Phone",text:  $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

    }
}

struct textfieldView_Previews: PreviewProvider {
    static var previews: some View {
        textfieldView()
    }
}
