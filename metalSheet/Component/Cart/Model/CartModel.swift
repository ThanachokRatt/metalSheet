//
//  CartModel.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//

import Foundation
import ObjectMapper

struct CartModel: Identifiable, Codable, Mappable ,Equatable{
    var id: String?
    var productImage: String = ""
    var productName: String = ""
    var description: String = ""
    var priceNocolor: Int = 0
    var priceColor: Int = 0
    var colorCategories: [String] = [""]//["เทาด้าน", "เทาเงา", "ดำด้าน", "ดำเงา", "น้ำตาล", "ลายไม้เข้ม", "ลายไม้อ่อน","ขาว","แดงเม็ดมะขาม","แดงอิฐ","แดงสด","ส้มอิฐ","ส้มสด","ชมพู","ครีม","เหลือง","ม่วง","น้ำเงิน","ฟ้า","เขียวเข้ม","เขียวบางจาก","เขียวร็อกเก็จ","เขียวหยก"]
    var categories: [String] = [""]//["0.20", "0.23", "0.35", "0.40", "0.47"]
	var currentPrice: Int = 0
    var selectedCategory: String = ""
    var selectedColorCategory: String = ""
	var selectedAddOnsCategory: String = ""
    var selectedLong: String = ""
    var selectedQty: String = ""
    var compositeKey: String = "" // Unique identifier for each product
    var calculatedPrice: Float {
        let floatSelectedLong = Float(selectedLong) ?? 1
        let intSelectedQty = Int(selectedQty) ?? 1
        
        return Float(currentPrice) * floatSelectedLong * Float(intSelectedQty)
    }
    var colorCategories2: [String] = ["อลูซิงค์"]
    mutating func updateColorCategories(newCategories: [String]) {
            self.colorCategories = newCategories
        }

	init(id: String, productImage: String, productName: String, description: String, categories: [String], priceNocolor: Int, priceColor: Int, colorCategories: [String], currentPrice: Int, selectedCategory: String, selectedColorCategory: String,selectedAddOnsCategory: String, selectedLong: String, selectedQty: String) {
        self.id = id
        self.productImage = productImage
        self.productName = productName
        self.description = description
        self.categories = categories
        self.priceNocolor = priceNocolor
        self.priceColor = priceColor
        self.colorCategories = colorCategories
		self.currentPrice = currentPrice
        self.selectedCategory = selectedCategory
        self.selectedColorCategory = selectedColorCategory
		self.selectedAddOnsCategory = selectedAddOnsCategory
        self.selectedLong = selectedLong
        self.selectedQty = selectedQty
        self.compositeKey = "\(id)_\(selectedCategory)_\(selectedColorCategory)_\(selectedLong)_\(selectedQty)"
       // Calculate the initial calculated price
    }

    init?(map: Map) { }

    mutating func mapping(map: Map) {
        id <- map["id"]
        productImage <- map["image"]
        productName <- map["title"]
        /*description <- map["details"]
         priceNocolor <- map["min_price"]
         priceColor <- map["max_price"]
         colorCategories <- map["color"]
         categories <- map["bmt"]*/
    }
    func updateCart() -> CartModel {
		return CartModel(id: id! , productImage: productImage, productName: productName, description: description, categories: categories, priceNocolor: priceNocolor, priceColor: priceColor, colorCategories: colorCategories, currentPrice: currentPrice, selectedCategory: selectedCategory, selectedColorCategory: selectedColorCategory, selectedAddOnsCategory: selectedAddOnsCategory, selectedLong: selectedLong, selectedQty: selectedQty)
    }

}





                


