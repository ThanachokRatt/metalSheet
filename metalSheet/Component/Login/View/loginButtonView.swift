//
//  loginButtonView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct loginButtonView: View {
    

    var body: some View {
        VStack {
            Text( "ล็อกอินเข้าสู่ระบบ")
                .padding(.all, 60)
                .frame(height: 55)
                .background(Color(.black))
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
                .font(.headline)
                .cornerRadius(30)
            .foregroundColor(Color(.white))
            
       
        }
      

    }
}

