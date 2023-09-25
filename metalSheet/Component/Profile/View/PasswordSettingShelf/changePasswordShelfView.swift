//
//  changePasswordView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct changePasswordShelfView: View {
    var body: some View {
        VStack (spacing: 15) {
            headerPasswordView()
            
            textfieldPasswordView()
            
     
            
            Spacer()
            
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct changePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        changePasswordShelfView()
    }
}
