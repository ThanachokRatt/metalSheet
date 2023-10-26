//
//  headerLocationView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct headerLocationView: View {
    var body: some View {
        VStack (spacing: 35){
            Image("busLogo")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 80,height: 80)
            
            Text("ที่อยู่จัดส่ง")
                .foregroundColor(.black).opacity(0.5)
                .font(.system(size:30))
                .fontWeight(.bold)
               
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading, 5)
        
        }.padding(EdgeInsets(top: 30, leading: 5, bottom: 30, trailing: 5))
           
    }
}

struct headerLocationView_Previews: PreviewProvider {
    static var previews: some View {
        headerLocationView()
    }
}
