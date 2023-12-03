//
//  registerButtonView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct registerButtonView: View {
    
 
    
    var body: some View {
        VStack {
            Text("สมัครสมาชิก")
                .padding(.all,50)
                .frame( height: 50)
                .background(Color(.white))
                .font(.headline)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius:  30).stroke(Color.black,lineWidth: 1))
                .foregroundColor(Color(.black))
                
        }
    }
}
/*struct registerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        registerButtonView()
    }
}*/
