//
//  ResetPasswordModel.swift
//  metalSheet
//
//  Created by Schweppe on 6/10/2566 BE.
//

import Foundation
import ObjectMapper

struct ResetPasswordModel: Mappable{
    var email: String = ""
    var newPassword: String = ""
    
    init(){}
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        email <- map["email"]
        newPassword <- map["newPassword"]
        
    }
    
}
