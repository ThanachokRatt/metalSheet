//
//  SplashScreenView.swift
//  metalSheet
//
//  Created by Schweppe on 10/9/2566 BE.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isShowingSplashScreen = true

    @EnvironmentObject var loginViewModel: LoginViewModel

    var body: some View {
        ZStack {
            Color.white // White background covering the entire screen
                .ignoresSafeArea()
            if isShowingSplashScreen {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            isShowingSplashScreen = false
                        }
                    }
            } else {
                if loginViewModel.isLoggedIn {
                    AllView()
                } else {
                    loginShelfView()
                }
            }
        }
    }
}

struct SplashScreen: View {
    @State private var size: CGFloat = 0.7
    @State private var opacity: Double = 0.5

    var body: some View {
        VStack {
            VStack {
                Image("removeTextLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 270, height: 270)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
            }
        }
    }
}
