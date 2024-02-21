//
//  OrderHistoryModel.swift
//  metalSheet
//
//  Created by Schweppe on 17/12/2566 BE.
//

import Foundation
import ObjectMapper

struct OrderHistoryDataModel: Mappable{
    var data : [OrderHistoryModel] = []
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

struct OrderHistoryModel: Mappable, Hashable  {
    var orderNumber:String = ""
    var orderStatus: String = ""
    var sumTotal: String = ""
    var orderLists: [orderDetailList] = []
    
    init(){}
    init?(map: Map){}
    mutating func mapping(map: Map) {
        orderNumber <- map["orderNo"]
        orderStatus <- map["status"]
        sumTotal <- map["grand_total"]
        orderLists <- map["order_list"]
    }
    
    
}

struct orderDetailList: Mappable,Hashable{
    var orderName: String = ""
    var bmt : String = ""
    var lenght : String = ""
    var qty: Int = 0
    var price: Int = 0
    var color: String = ""
    
    init(){}
    init?(map: Map){}
    mutating func mapping(map: Map) {
        orderName <- map["name"]
        bmt <- map["bmt"]
        lenght <- map["length"]
        qty <- map["qty"]
        price <- map["price"]
        color <- map["color"]
    }
    
}
