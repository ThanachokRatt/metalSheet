//
//  infoImageModel.swift
//  metalSheet
//
//  Created by Schweppe on 22/10/2566 BE.
//

import Foundation
import ObjectMapper


struct InfoImageModel: Mappable {
    var data: [InfoDataModel] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}
struct InfoDataModel: Mappable, Identifiable,Hashable {
    var id: Int
    var descriptionHome: String = ""
    var img_src: [String] = []

    init?(map: Map) {
            id = 0
        }

    mutating func mapping(map: Map) {
        id <- map["id"]
        descriptionHome <- map["description"]
        img_src <- map["img_src"]
    }
}
