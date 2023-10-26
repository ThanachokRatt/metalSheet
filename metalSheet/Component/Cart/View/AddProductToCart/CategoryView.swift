//
//  CategoryView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading,spacing: 0) {
            Text(text)
                .font(.system(size:13))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.black : Color.black.opacity(0.5))
            if(isActive){
                Color("lipstick")
                    .frame(width: 25,height: 2)
                
            }
            
        }
    }
}

