//
//  btnView.swift
//  metalSheet
//
//  Created by Schweppe on 7/9/2566 BE.
//

import SwiftUI

struct btnView: View {
    var image: String
    var name: String
    
    var body: some View {
        
            HStack (spacing: 15){
                Image( image).renderingMode(.original).resizable()
                    .cornerRadius(20)
                    .frame(width: 50,height: 50)
                
                Text(name)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding()
                .foregroundColor(Color.black.opacity(0.6))
        }
    
    
    
}

struct btnView_Previews: PreviewProvider {
    static var previews: some View {
        btnView(image: "busLogo", name: "จัดการข้อมูลส่วนตัว")
    }
}
