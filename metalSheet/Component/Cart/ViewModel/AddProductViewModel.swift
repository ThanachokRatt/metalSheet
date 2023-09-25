//
//  OrderHistoryModel.swift
//  metalSheet
//
//  Created by Schweppe on 19/9/2566 BE.
//

import Foundation
import SwiftUI

class AddProductViewModel: ObservableObject {
    @Published private(set) var items: [CartModel] = []{
        didSet{
            saveItem()
            UserDefaults.standard.set(total, forKey: totalKey)
        }
    }
    @Published private(set) var total: Int = 0
    @Published private(set) var isCategoryEnabled: Bool = true
    @Published private(set) var selectedCategory: String = "0.35"
    @Published private(set) var selectedColorCategory: String = "อลูซิงค์"
    @Published private(set) var selectedLong: String = "1"
    @Published private(set) var selectedQty: String = "1"
    
    let itemsCartKey: String = "cart_List"
 
    let totalKey: String = "total_key"

    init(){
        getItems()
        calculateTotal()
 
    }
    
    func calculateTotal() {
            total = items.reduce(0) { $0 + $1.calculatedPrice }
        }

    
    
    func updateisCategoryEnabled(_ newValue: Bool) {
        isCategoryEnabled = newValue
    }
    func updateSelectedCategory(_ category: String) {
            selectedCategory = category
        }
    func updateSelectedLong(_ long: String){
        selectedLong = long
    }
    
    func updateSelectedQty(_ Qty: String){
        selectedQty = Qty
    }
    
   
    
    
    func updateSelectedColorCategory(_ colorCategory: String) {
        selectedColorCategory = isCategoryEnabled ? colorCategory : "อลูซิงค์"
        }

    func addToCart(product: CartModel) {
        // Make a copy of the product
        var updatedProduct = product
        
        // Update the currentPrice in the copied product
        updatedProduct.currentPrice = isCategoryEnabled ? product.priceColor : product.priceNocolor
        
        // Assign the selected category to the copied product
        updatedProduct.selectedCategory = selectedCategory
        
        updatedProduct.selectedColorCategory = selectedColorCategory
        
        updatedProduct.selectedLong = selectedLong
        
        updatedProduct.selectedQty = selectedQty
        
        let calculatedPrice = updatedProduct.calculatedPrice
            
        total += calculatedPrice
            // Append the updated product to the products array
        items.append(updatedProduct)
    }

    func removeFromCart(product: CartModel) {
        items = items.filter { $0.id != product.id }

        // Calculate the total after removing the product
        total -= product.calculatedPrice
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsCartKey),
              let savedItem = try? JSONDecoder().decode([CartModel].self, from: data)
           
        else{return}
        
        self.items = savedItem
      
        

          }
    
    func addItem(productImage: String, productName: String, description: String, categories: [String], priceNocolor: Int, priceColor: Int, colorCategories: [String], currentPrice: Int, selectedCategory: String, selectedColorCategory: String, selectedLong: String, selectedQty: String) {
        
        let newItem = CartModel(productImage: productImage, productName: productName, description: description, categories: categories, priceNocolor: priceNocolor, priceColor: priceColor, colorCategories: colorCategories, currentPrice: currentPrice, selectedCategory: selectedCategory, selectedColorCategory: selectedColorCategory, selectedLong: selectedLong, selectedQty: selectedQty)
        
        items.append(newItem)
        
    }
    
    func updateItems(item: CartModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCart()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsCartKey)
            
            
        }
    }
}



