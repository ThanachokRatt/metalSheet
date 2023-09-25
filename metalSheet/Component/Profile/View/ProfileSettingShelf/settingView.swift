//
//  headerView.swift
//  metalSheet
//
//  Created by Schweppe on 7/9/2566 BE.
//

import SwiftUI

struct settingView: View {
    var body: some View {
        VStack (spacing: 35){
            Image("removeBgLogo")
                .resizable()
                .cornerRadius(20)
                .scaledToFit()
                .frame(width: 140,height: 140)
            Text("การตั้งค่า")
                .foregroundColor(.black).opacity(0.5)
                .font(.system(size:30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
            .padding(20)
        
        }
       
    }
}

struct headerView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}
