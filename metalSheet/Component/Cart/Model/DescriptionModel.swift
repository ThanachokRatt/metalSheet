//
//  DescriptionModel.swift
//  metalSheet
//
//  Created by Schweppe on 13/1/2567 BE.
//

import Foundation

struct Variation: Codable, Mappable {
    var name: String = ""
    var options: [String] = []

    init() {}
    init?(map: Map) {}


    mutating func mapping(map: Map) {
        name <- map["name"]
        options <- map["options"]
    }
}

struct Model: Mappable {
    var name: String?
    var price: Int?
    var status: Bool = false

    init?(map: Map) {}


    mutating func mapping(map: Map) {
        name <- map["name"]
        price <- map["price"]
        status <- map["status"]
    }
}
import ObjectMapper

class DescriptionModel: ObservableObject,Mappable,Identifiable {
    var id: String = ""
    var title: String = ""
    var image: String = ""
    var note: String?
    var note2: String?
    var priceMin: Int = 0
    var priceMax: Int = 0
	var images: [String]  = []
    var description: String = ""
    var variations: [Variation] = []
    var models: [Model] = []
	//addproductfunction
	var currentPrice: Int = 0
	var compositeKey: String = ""
	
	required init?(map: Map) {}

	func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        image <- map["image"]
        note <- map["note"]
        note2 <- map["note_2"]
        priceMin <- map["price_min"]
        priceMax <- map["price_max"]
		images <- map["images"]
        description <- map["description"]
        variations <- map["variations"]
        models <- map["models"]
    }
}

