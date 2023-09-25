//
//  saveInfoPasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct saveInfoPasswordView: View {
    var body: some View {
        VStack {
            Text("บันทึกข้อมูล")
                .padding(.all,50)
                .frame( height: 50)
                
                .font(.headline)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius:  30).stroke(Color.black,lineWidth: 1))
                .foregroundColor(Color(.black))
        }.padding(.top,40)
    }
}

struct saveInfoPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        saveInfoPasswordView()
    }
}
