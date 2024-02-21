//
//  MapCardViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 5/9/2566 BE.
//

import Foundation
import ObjectMapper

struct MapCardModel: Identifiable, Codable, Mappable {
	var id: String?
	var image: String
	var title: String
	var url: String
	
	init(id: String = UUID().uuidString, image: String, title: String, url: String) {
		self.id = id
		self.image = image
		self.title = title
		self.url = url
	}
	
	init?(map: Map) {
		self.id = nil // Initialize id to nil or any other default value
		self.image = "" // Initialize image to an empty string or any other default value
		self.title = "" // Initialize title to an empty string or any other default value
		self.url = "" // Initialize url to an empty string or any other default value
	}
	
	mutating func mapping(map: Map) {
		title <- map["title"]
		image <- map["img_name"]
		url <- map["img_url"]
	}
	
}

/*var mapCardViewModel = [
MapCardViewModel(image: "lumluka", title: "สาขาลำลูกกา",url: "https://goo.gl/maps/MK7K3drtWHw3gsco6"),
MapCardViewModel(image: "meanburi", title: "สาขามีนบุรี",url: "https://goo.gl/maps/BoRAYxs3trQtgf5o6"),
MapCardViewModel(image: "ลาดกระบัง", title: "สาขาลาดกระบัง",url: "https://goo.gl/maps/y2AznroHAuuwHQGV8")
]*/
