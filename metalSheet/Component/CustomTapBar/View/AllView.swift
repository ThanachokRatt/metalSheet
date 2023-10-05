//
//  AllView.swift
//  metalSheet
//
//  Created by Schweppe on 5/9/2566 BE.
//

import SwiftUI

struct AllView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject var addProductHistoryModel = AddProductViewModel()
    @EnvironmentObject var loginViewModel: LoginViewModel

  //  @StateObject var navigationStackController = NavigationStackController()
   
    var body: some View {
        NavigationStack {
            ZStack {
                
                switch selectedTab {
                case .home:
                    homeShelfView()
                        .environmentObject(loginViewModel)
                case .cart:
                    ProductCartView()
                    
             
                case .signout:
                    profileSettingShelfView()
                    
                }
                TabBar()
            }
        }.accentColor(.black)
        .navigationViewStyle(StackNavigationViewStyle())
    //    .environmentObject(navigationStackController)
            
    }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
            .environmentObject(AddProductViewModel())
            .environmentObject(LocationViewModel())
            .environmentObject(NavigationStackController())
            .environmentObject(LoginViewModel())
    }
}
