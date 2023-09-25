//
//  loginButtonView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct loginButtonView: View {
    @State private var isPresented = false
    var body: some View {
        VStack {
            Button( "ล็อกอินเข้าสู่ระบบ", action: {
                isPresented = true
            }) .padding(.all, 60)
                .frame(height: 55)
                .background(Color(.black))
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
                .font(.headline)
                .cornerRadius(30)
            .foregroundColor(Color(.white))
            
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            AllView()
        })

    }
}

struct loginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        loginButtonView()
    }
}
