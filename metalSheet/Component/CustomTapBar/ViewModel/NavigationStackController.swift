//
//  NavigationStackController.swift
//  metalSheet
//
//  Created by Schweppe on 27/9/2566 BE.
//

import Foundation

class NavigationStackController: ObservableObject {
    @Published var isActive: Bool = false
    
    func resetNavigationStack() {
            isActive = false
        }
}
