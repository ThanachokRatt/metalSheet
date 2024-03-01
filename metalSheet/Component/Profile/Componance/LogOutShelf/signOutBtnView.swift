//
//  signOutBtnView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//
import SwiftUI

struct signOutBtnView: View {


    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack {
            
                btnView(image: "logoutLogo", name: "ออกจากระบบ")
            
        }.font(Font.custom("Pridi-Light",size: isiPad ? 27 : 18))
       
    }
}


/*struct signOutBtnView_Previews: PreviewProvider {
    static var previews: some View {
        signOutBtnView()
    }
}*/
