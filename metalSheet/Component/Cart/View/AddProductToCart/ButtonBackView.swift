//
//  ButtonBackView.swift
//  metalSheet
//
//  Created by Schweppe on 18/9/2566 BE.
//

import SwiftUI

struct ButtonBackView: View {
    @State private var isFullScreenPresented = false
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                            isFullScreenPresented.toggle()
                        }) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .frame(width: 55,height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                .shadow(radius: 3)
                        }.padding(.top,-10)
                    .padding(.leading,15)
                Spacer()
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
                    // แสดงหน้าจอ fullscreen ที่คุณต้องการ
                    AllView()
        }
        
    }
    
}

struct ButtonBackView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBackView()
    }
}
