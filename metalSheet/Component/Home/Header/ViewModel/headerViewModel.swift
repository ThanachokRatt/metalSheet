//
//  headerViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 29/8/2566 BE.
//

import Foundation
import SwiftUI


public enum pickColor {
    case lightGreen
    case slgreen
    
    var color: Color{
        switch self{
            
        case .lightGreen:
            return Color("lightGreen")
            
        case .slgreen:
            return Color("slgreen")
            
        }
    }
}
