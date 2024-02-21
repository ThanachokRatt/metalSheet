//
//  textfieldPersonalView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct textfieldPersonalView: View {
  
    
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Binding var name:String
    @Binding var phone:String
    @Binding var isEditingEnabled: Bool
    
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack(spacing: 10){
           
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "envelope")
                            .foregroundColor(Color(.black))
                        Text("อีเมล")
                            
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    Text(loginViewModel.email)
                    
                       
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))// Set text alignment to leading
                        .background(
                            RoundedRectangle(cornerRadius: 5) // RoundedRectangle overlay
                                .stroke(Color.black, lineWidth: 1) // Black border
                        )
                        .background(Color.gray.opacity(0.5))
                        .cornerRadius(5)
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
               
               
            }
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "person.text.rectangle")
                            .foregroundColor(Color(.black))
                        Text("ชื่อจริง-นามสกุล")
                           
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    TextField(loginViewModel.name,text:  $name)
                        .foregroundColor(isEditingEnabled ? Color.black : Color.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(!isEditingEnabled)
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
               
               
            }
            HStack  (spacing: 22){
                
                VStack (spacing: 10){
                    
                    HStack (spacing: 5){
                        Image(systemName: "phone")
                            .foregroundColor(Color(.black))
                        Text("เบอร์มือถือ")
                            
                        
                    }.frame(maxWidth: .infinity,alignment: .leading)
                    
                    
                    TextField(loginViewModel.phone,text:  $phone)
                        .foregroundColor(isEditingEnabled ? Color.black : Color.gray)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(!isEditingEnabled)
                        .keyboardType(.numberPad)
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
               
               
            }
           
            
     
            
        }
        .font(Font.custom("Pridi-Light",size: isiPad ? 25 : 17))
        .accentColor(Color.black)
    }
  
    
}

