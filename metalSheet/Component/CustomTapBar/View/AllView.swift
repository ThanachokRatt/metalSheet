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
        @EnvironmentObject var locationViewModel: LocationViewModel

        @EnvironmentObject var addProductViewModel: AddProductViewModel
        @EnvironmentObject var personalViewModel: PersonalViewModel
        @EnvironmentObject var orderViewModel: OrderViewModel
    @State private var isLoginSheetPresented = false

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
                    if loginViewModel.isLoggedIn{
                        profileSettingShelfView()
                    }else{
                        singInAndRegisterBtnView()
                            }
                    
                   
                    
                }
                TabBar()
            }
        }.accentColor(.black)
        .navigationViewStyle(StackNavigationViewStyle())
    //    .environmentObject(navigationStackController)
        .onAppear{
           /* if loginViewModel.loginSuccess{
                selectedTab = .home
            }*/
             selectedTab = .home
              personalViewModel.id = "\(loginViewModel.id)"
              orderViewModel.id = "\(loginViewModel.id)"
              locationViewModel.itemsKey = "Location_List_\(loginViewModel.id)"
              addProductViewModel.itemsCartKey = "Cart_Key_\(loginViewModel.id)"
              addProductViewModel.totalKey = "Total_Key_\(loginViewModel.id)"
            

              addProductViewModel.getTotal() // Load the total price in the cart
              addProductViewModel.getItems() // Get items in the cart
              locationViewModel.getItem()
           
        }
            
    }
}

/*struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
            .environmentObject(LoginViewModel())
            .environmentObject(LocationViewModel())
            .environmentObject( OrderViewModel())
            .environmentObject(PersonalViewModel())
            .environmentObject(AddProductViewModel())
    }
}*/
