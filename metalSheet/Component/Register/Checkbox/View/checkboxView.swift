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
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                selectedOption = 0
            }) {
                Image(systemName: selectedOption == 0 ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color(.black))
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
            Text("ลูกค้า")
            
            Button(action: {
                selectedOption = 1
                
            }) {
                Image(systemName: selectedOption == 1 ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(Color(.black))
            }
            .buttonStyle(PlainButtonStyle())
            Text("ช่าง")
          
              
        }
    }
}


struct checkboxView_Previews: PreviewProvider {
    static var previews: some View {
        checkboxView()
    }
}
