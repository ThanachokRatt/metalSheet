//
//  TabBarViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 6/9/2566 BE.
//

import Foundation
import RiveRuntime

struct TabItem: Identifiable {
    var id = UUID()
    var icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(icon: "house.fill" , tab: .home),
    TabItem(icon: "cart.fill",tab: .cart),
    TabItem(icon: "person.fill",tab: .signout)
    
]

/*import Foundation
 import RiveRuntime

 struct TabItem: Identifiable {
     var id = UUID()
     var icon: RiveViewModel
     var tab: Tab
 }

 var tabItems = [
     TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity",artboardName: "HOME"),tab: .home),
     TabItem(icon: RiveViewModel(fileName: "iconss", stateMachineName: "STAR_Interactivity",artboardName: "LIKE/STAR"),tab: .cart),
     TabItem(icon: RiveViewModel(fileName: "iconss", stateMachineName: "TIMER_Interactivity",artboardName: "TIMER"),tab: .history),
     TabItem(icon: RiveViewModel(fileName: "iconss", stateMachineName: "state_machine",artboardName: "SIGNOUT"),tab: .signout)
     
 ]*/
