//
//  headerPersonalView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct headerPersonalView: View {
    var body: some View {
        VStack (spacing: 35){
            Image("userLogo")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 80,height: 80)
            
            Text("ข้อมูลส่วนตัว")
                .foregroundColor(.black).opacity(0.5)
                .font(.system(size:30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, -5)
        
        }.padding(EdgeInsets(top: 30, leading: 5, bottom: 30, trailing: 5))
            
    }
}

struct headerPersonalView_Previews: PreviewProvider {
    static var previews: some View {
        headerPersonalView()
    }
}
