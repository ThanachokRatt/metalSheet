//
//  textfieldPasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct textfieldPasswordView: View {
    @State private var password = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(spacing: 10){
            HStack (spacing: 30){
                Image(systemName: "lock")
                    .foregroundColor(Color(.black))
                TextField("Current Password",text:  self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack  (spacing: 22){
                Image(systemName: "eye.slash")
                    .foregroundColor(Color(.black))
                TextField("New Password",text:  $newPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack  (spacing: 22){
                Image(systemName: "eye.slash")
                    .foregroundColor(Color(.black))
                TextField("Confirm Password",text:  $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
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

struct textfieldPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        textfieldPasswordView()
    }
}
