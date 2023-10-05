//
//  registerModel.swift
//  metalSheet
//
//  Created by Schweppe on 1/10/2566 BE.
//

import Foundation
import ObjectMapper

struct RegisterModel: Mappable{
    var email:String = ""
    var password: String = ""
    var name: String = ""
    var phone: String = ""
    var role: String = ""
    init() {}
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        email <- map["email"]
        password <- map["password"]
        name <- map["name"]
        phone <- map["phone"]
        role <- map["role"]
    }
}
