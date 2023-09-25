//
//  CartModel.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//

import Foundation

struct CartModel: Identifiable,Codable{
    var id: String
    var productImage: String
    var productName: String
    
    //AddProductToCartView
    
   
    var description: String
    var categories:[String]
    var priceNocolor: Int
    var priceColor: Int
 
    var colorCategories: [String]
    
    var currentPrice: Int = 0
    
    var selectedCategory: String = ""
    var selectedColorCategory: String = ""
    var selectedLong: String = ""
    var selectedQty: String = ""
    
    var total: Int = 0
    
    var calculatedPrice: Int {
      return currentPrice * (Int(selectedLong) ?? 1) * (Int(selectedQty) ?? 1)
    }
    
    
    var total2: Int {
        return  total + currentPrice * (Int(selectedLong) ?? 1) * (Int(selectedQty) ?? 1)
    
    }
    
    init(id: String = UUID().uuidString, productImage: String, productName: String, description: String, categories: [String], priceNocolor: Int, priceColor: Int, colorCategories: [String], currentPrice: Int, selectedCategory: String, selectedColorCategory: String, selectedLong: String, selectedQty: String,total: Int) {
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
        self.selectedLong = selectedLong
        self.selectedQty = selectedQty
        self.total = total
    }
    func updateCart() -> CartModel{
        return CartModel(id:id,productImage: productImage, productName: productName, description: description, categories: categories, priceNocolor: priceNocolor, priceColor: priceColor, colorCategories: colorCategories, currentPrice: currentPrice, selectedCategory: selectedCategory, selectedColorCategory: selectedColorCategory, selectedLong: selectedLong, selectedQty: selectedQty, total: total)
    }
}





                


