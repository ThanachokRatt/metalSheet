//
//  personalSettingView.swift
//  metalSheet
//
//  Created by Schweppe on 12/9/2566 BE.
//

import SwiftUI

struct personalSettingShelfView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var name = ""
    @State private var sureName = ""
    @State private var phone = ""
    
    var body: some View {
        
        VStack(spacing: 15) {
            headerPersonalView()
            
            textfieldPersonalView()
            
       
            
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
    }
}



struct personalSettingView_Previews: PreviewProvider {
    static var previews: some View {
        personalSettingShelfView()
    }
}
