//
//  SplashScreenView.swift
//  metalSheet
//
//  Created by Schweppe on 10/9/2566 BE.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            loginShelfView()
        } else {
            VStack{
                VStack{
                    Image("removeBgLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 270,height: 270)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
