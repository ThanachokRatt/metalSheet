//
//  OrderModel.swift
//  metalSheet
//
//  Created by Schweppe on 13/10/2566 BE.
//

import Foundation
import ObjectMapper

struct OrderModel:Mappable{
	var name: String = ""
	var phone: String = ""
	var address: String = ""
	var postcode: String = ""
	var type: String = ""
	var grandTotal: String = ""
	var locationUrl: String = ""
	var additional: String = ""

	var orderList: [OrderItem] = []
	
	init() {}
	init?(map: Map) {}
	
	mutating func mapping(map: Map) {
		name <- map["name"]
		phone <- map["phone"]
		address <- map["address"]
		postcode <- map["postcode"]
		type <- map["type"]
		grandTotal <- map["grand_total"]
		locationUrl <- map["location_url"]
		additional <- map["additional"]
	    orderList <- map["order_list"]
	}
  
	
}


struct OrderItem: Mappable{
	var itemId: String = ""
	var name: String = ""
	var bmt: String = ""
	var length: String = ""
	var color: String = ""
	var qty: Int = 0
	var price: Float = 0.00
	var addon: String = ""
	
	init() {}
	init?(map: Map){}
	mutating func mapping(map: Map) {
		itemId <- map["item_id"]
		name <- map["name"]
		bmt <- map["bmt"]
		length <- map["length"]
		color <- map["color"]
		qty <- map["qty"]
		price <- map["price"]
		addon <- map["addon"]
		
	}
}


