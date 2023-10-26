//
//  signOutBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//
import SwiftUI

struct signOutBtnView: View {


    var body: some View {
        VStack {
            
                btnView(image: "logoutLogo", name: "ออกจากระบบ")
            
        }
       
    }
}


struct signOutBtnView_Previews: PreviewProvider {
    static var previews: some View {
        signOutBtnView()
    }
}
