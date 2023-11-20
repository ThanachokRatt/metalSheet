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
    var detail: String = ""
    var orderList: [OrderItem] = []
    
    init() {}
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        phone <- map["phone"]
        address <- map["address"]
        detail <- map["detail"]
        orderList <- map["order_list"]
    }
  
    
}


struct OrderItem: Mappable{
    var itemId: Int = 0
    var name: String = ""
    var bmt: String = ""
    var length: String = ""
    var color: String = ""
    var qty: Int = 0
    var price: Int = 0
    
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
        
    }
}

