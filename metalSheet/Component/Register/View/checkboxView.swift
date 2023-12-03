//
//  checkboxView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct checkboxView: View {
    @State private var selectedOption = 0
    let options = ["ลูกค้า", "ช่าง"]
    @Binding var role: String
    
   
    
    var body: some View {
        HStack(spacing: 15) {
            
            Button(action: {
                selectedOption = 0
                role = (options[selectedOption])
              
            }) {
                Image(systemName: selectedOption == 0 ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color(.black))
            }
            .buttonStyle(PlainButtonStyle())
      
            Text("ลูกค้า")
            
            Button(action: {
                selectedOption = 1
                role = (options[selectedOption])
              //  print(role)
            }) {
                Image(systemName: selectedOption == 1 ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color(.black))
                  
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("ช่าง")
          
              
        }
    }
}




