//
//  tapBarView.swift
//  metalSheet
//
//  Created by Schweppe on 1/9/2566 BE.
//

import SwiftUI

struct tapBarView: View {
    init() {
           // Customize the appearance of the tab bar
           let appearance = UITabBarAppearance()
           appearance.backgroundColor = UIColor.black // Set your desired background color
           
           UITabBar.appearance().standardAppearance = appearance
       }
    @State private var selectedTab: Tab = .home
    enum Tab {
        case home,cart,profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            homeShelfView()
                .tabItem{
                    Image(systemName: selectedTab == .home ? "house.fill" : "house")
                       
                    Text("Home")
                }
                .tag(Tab.home)
            
            cartView()
                .tabItem{
                    Image(systemName: selectedTab == .cart ? "cart.fill" : "cart")
                        
               
                    Text("Cart")
                }
           
                .tag(Tab.cart)
            
            profileView()
                .tabItem{
                    Image(systemName: selectedTab == .profile ? "person.fill" : "person")
        
                    Text("Profile")
                }
                .tag(Tab.profile)
        }
        
        .accentColor(.accentColor)
          
    }
    
}

struct tapBarView_Previews: PreviewProvider {
    static var previews: some View {
        tapBarView()
    }
}
