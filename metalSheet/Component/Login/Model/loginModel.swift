//
//  loginModel.swift
//  metalSheet
//
//  Created by Schweppe on 2/10/2566 BE.
//

import Foundation
import ObjectMapper

struct LoginModel: Mappable{
    var email: String = ""
    var password: String = ""
    
    init() {}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        email <- map["email"]
        password <- map["password"]
    }
}

