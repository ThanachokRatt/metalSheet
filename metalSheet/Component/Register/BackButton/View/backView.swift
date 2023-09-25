//
//  profileView.swift
//  metalSheet
//
//  Created by Schweppe on 26/8/2566 BE.
//

import SwiftUI

struct backView: View {
    let imageName : String
    var body: some View {
        HStack {
            
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Circle())
        
            
            
        
            }
        }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            backView(imageName: "chevron.backward")
                .padding()
            Spacer()
        }
        
    }
}
