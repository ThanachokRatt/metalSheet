//
//  headerView.swift
//  metalSheet
//
//  Created by Schweppe on 7/9/2566 BE.
//

import SwiftUI

struct settingView: View {
    var body: some View {
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        VStack (spacing: 15){
            Image("removeTextLogo")
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .frame(width: 180,height: 180)
            Text("การตั้งค่า")
                .foregroundColor(.black)
                .font(Font.custom("Pridi-Light",size: isiPad ? 40 : 30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
        
        }
       
    }
}

/*struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}*/
