//
//  registerButtonInLoginView.swift
//  metalSheet
//
//  Created by Schweppe on 27/8/2566 BE.
//

import SwiftUI

struct registerButtonInLoginView: View {
    
    var body: some View {
     
            VStack {
                Text("ยังไม่เป็นสมาชิก?").foregroundColor(Color(.black))
                    .font(.subheadline)
                
                NavigationLink(destination: registerShlefView(), label:  {
                    Text("สมัครสมาชิก")
                })
                .padding(.all,50)
                .frame( height: 50)
                .background(Color(.white))
                .font(.headline)
                .overlay(RoundedRectangle(cornerRadius:  30).stroke(Color.black,lineWidth: 1))
                .foregroundColor(Color(.black))
            }
            
        
    }
}

struct registerButtonInLoginView_Previews: PreviewProvider {
    static var previews: some View {
        registerButtonInLoginView()
    }
}
