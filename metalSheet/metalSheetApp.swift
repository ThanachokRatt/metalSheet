//
//  metalSheetApp.swift
//  metalSheet
//
//  Created by Schweppe on 21/8/2566 BE.
//

import SwiftUI

@main

struct metalSheetApp: App {
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var addProductHistoryModel = AddProductViewModel()
    @StateObject var locationViewModel = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(loginViewModel)
                .environmentObject(addProductHistoryModel)
                .environmentObject(locationViewModel)
              
        }
    }
}
