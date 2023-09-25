//
//  plusAndMinusButtonView.swift
//  metalSheet
//
//  Created by Schweppe on 14/9/2566 BE.
//

import SwiftUI

struct plusAndMinusButtonView: View {
    @State private var count = 1 // Initial count

    var body: some View {
        HStack{
            Button(action: {
                if count > 1 {
                    count -= 1
                }
            }) {
                Image(systemName: "minus")
                    .padding(.all, 8)
                
            }
            .frame(width: 25, height: 25)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
            .foregroundColor(.black)
            
            Text("\(count)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
            
            Button(action: {
                count += 1
            }) {
                Image(systemName: "plus")
                    .padding(.all, 8)
                
            }
            .frame(width: 25, height: 25)
            .background(Color("lipstick").opacity(0.7))
            .clipShape(Circle())
            .foregroundColor(.white)
        }
    }
}


struct plusAndMinusButtonView_Previews: PreviewProvider {
    static var previews: some View {
        plusAndMinusButtonView()
    }
}
