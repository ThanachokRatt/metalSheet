//
//  textfieldPersonalView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct textfieldPersonalView: View {
  
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var name = ""
    @State private var phone = ""
    var body: some View {
        VStack(spacing: 10){
           
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "envelope")
                            .foregroundColor(Color(.black))
                        Text("Email")
                            
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField("Email",text:  $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
               
               
            }
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(Color(.black))
                        Text("Name")
                           
                        
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
           
            
        
            VStack {
                Button {
                    Save()
                } label: {
                    Text("บันทึกข้อมูล")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("lipstick"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                      
                        
                }.padding()
            }
            
        }
        
    }
    func Save() {
        print("Saved")
    }
    
}

struct textfieldPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        textfieldPersonalView()
    }
}
