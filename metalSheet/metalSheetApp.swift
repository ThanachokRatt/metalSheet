//
//  metalSheetApp.swift
//  metalSheet
//
//  Created by Schweppe on 21/8/2566 BE.
//

import SwiftUI

@main

struct metalSheetApp: App {
    @StateObject var addProductHistoryModel = AddProductViewModel()
    @StateObject var locationViewModel = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(addProductHistoryModel)
                .environmentObject(locationViewModel)
        }
    }
}
