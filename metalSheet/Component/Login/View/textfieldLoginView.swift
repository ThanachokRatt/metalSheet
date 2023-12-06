//
//  textfieldLoginView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct textfieldLoginView: View {
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        VStack {
            Image("logoMetalSheet").resizable()
                .frame(width: 200,height: 160)
                .cornerRadius(30)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
              
                .frame(width: 300,height: 50)
               
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius:  10).stroke(Color.black,lineWidth: 1))
               
               
            
               
            
            SecureField("Password", text: $password)
                .padding()
            
                .frame(width: 300,height: 50)
              
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius:  10).stroke(Color.black,lineWidth: 1))
              
                
        }
        
    }
}


