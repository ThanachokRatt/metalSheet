//
//  PersonalModel.swift
//  metalSheet
//
//  Created by Schweppe on 12/10/2566 BE.
//

import Foundation
import ObjectMapper

struct PersonalModel: Mappable{
    var name: String = ""
    var phone: String = ""
    
    init() {}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        phone <- map["phone"]
    }
}
