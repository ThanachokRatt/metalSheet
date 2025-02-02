//
//  headerPasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct headerPasswordView: View {
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack (spacing: 35){
            Image("passwordLogo")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 80,height: 80)
            
            Text("เปลี่ยนรหัสผ่าน")
                .foregroundColor(.black)
                .font(Font.custom("Pridi-Regular",size: isiPad ? 40 : 30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, -5)
        
        }.padding(EdgeInsets(top: 30, leading: 5, bottom: 25, trailing: 5))
    }
}

/*struct headerPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        headerPasswordView()
    }
}*/
