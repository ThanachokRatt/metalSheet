//
//  addNewlocationView.swift
//  metalSheet
//
//  Created by Schweppe on 13/9/2566 BE.
//

import SwiftUI

struct addNewlocationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("ที่อยู่ใหม่")
                .foregroundColor(.black).opacity(0.6)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding(15)
            addLocationView()
         
        }.background(Color("gray"))
    }
}


struct addNewlocationView_Previews: PreviewProvider {
    static var previews: some View {
        addNewlocationView()
    }
}

