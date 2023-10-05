//
//  loginValueModel.swift
//  metalSheet
//
//  Created by Schweppe on 5/10/2566 BE.
//

import Foundation
struct LoginValueModel: Codable{
    let name: String?
    init(name: String?) {
        
        self.name = name
    }
}

