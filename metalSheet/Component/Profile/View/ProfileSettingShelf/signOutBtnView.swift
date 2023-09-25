//
//  signOutBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct signOutBtnView: View {
    @State private var isPresented = false
    var body: some View {
        VStack {
            Button(action: {
                isPresented = true
               
            }) {
                btnView(image: "logoutLogo", name: "ออกจากระบบ")
            }

           
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            loginShelfView()
        })
    }
    
}

struct signOutBtnView_Previews: PreviewProvider {
    static var previews: some View {
        signOutBtnView()
    }
}
