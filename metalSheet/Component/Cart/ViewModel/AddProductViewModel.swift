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
    @Published private(set) var  currentPrice: Int = 0
    @EnvironmentObject var loginViewModel: LoginViewModel
 
    
    @Published var  itemsCartKey: String = ""
 
    @Published var  totalKey: String = ""

    
    
 
    func calculateTotal() {
            total = items.reduce(0) { $0 + $1.calculatedPrice }
            UserDefaults.standard.set(total, forKey: totalKey)
        }
    func getTotal() {
        if let savedTotal = UserDefaults.standard.value(forKey: totalKey) as? Int {
            total = savedTotal
        }
    }

    func updateCurrentPrice(product: CartModel) {
        var items = product
        items.currentPrice = isCategoryEnabled ? product.priceColor : product.priceNocolor
        currentPrice = items.currentPrice
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
        // Check if the product with the same compositeKey already exists in the cart
        if let existingIndex = items.firstIndex(where: { $0.compositeKey == product.compositeKey }) {
            // Product already exists in the cart, create a new instance with a unique ID
            var existingProduct = items[existingIndex]

            // Update the selectedCategory and other details in the new instance
            existingProduct.currentPrice = isCategoryEnabled ? product.priceColor : product.priceNocolor
            existingProduct.selectedCategory = selectedCategory
            existingProduct.selectedColorCategory = selectedColorCategory
            existingProduct.selectedLong = selectedLong
            existingProduct.selectedQty = selectedQty
           

            // Create a new instance with a unique ID
            let newItem = CartModel(id: UUID().hashValue, productImage: product.productImage, productName: product.productName, description: product.description, categories: product.categories, priceNocolor: product.priceNocolor, priceColor: product.priceColor, colorCategories: product.colorCategories, currentPrice: currentPrice, selectedCategory: selectedCategory, selectedColorCategory: selectedColorCategory, selectedLong: selectedLong, selectedQty: selectedQty)

            // Append the new item to the cart
            items.append(newItem)

            // Update the total
            calculateTotal()
            
        } else {
            // Product does not exist in the cart, add it
            var updatedProduct = product

            // Update the currentPrice in the copied product
            updatedProduct.currentPrice = isCategoryEnabled ? product.priceColor : product.priceNocolor

            // Assign the selected category to the copied product
            updatedProduct.selectedCategory = selectedCategory
            updatedProduct.selectedColorCategory = selectedColorCategory
            updatedProduct.selectedLong = selectedLong
            updatedProduct.selectedQty = selectedQty

            // Append the updated product to the cart
            // Calculate the price
            items.append(updatedProduct)

            // Update the total
            calculateTotal()
        }
      
    }


    func removeFromCart(product: CartModel) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            total -= items[index].calculatedPrice
            items.remove(at: index)
        }
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsCartKey),
              let savedItem = try? JSONDecoder().decode([CartModel].self, from: data)
           
        else{return}
        
        self.items = savedItem
      
        

          }
    

    
    func addItem(id: Int,productImage: String, productName: String, description: String, categories: [String], priceNocolor: Int, priceColor: Int, colorCategories: [String], currentPrice: Int, selectedCategory: String, selectedColorCategory: String, selectedLong: String, selectedQty: String) {
        
        let newItem = CartModel(id: id, productImage: productImage, productName: productName, description: description, categories: categories, priceNocolor: priceNocolor, priceColor: priceColor, colorCategories: colorCategories, currentPrice: currentPrice, selectedCategory: selectedCategory, selectedColorCategory: selectedColorCategory, selectedLong: selectedLong, selectedQty: selectedQty)
        
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
    func removeAllItems() {
        items.removeAll()
        total = 0
        UserDefaults.standard.removeObject(forKey: itemsCartKey)
        UserDefaults.standard.removeObject(forKey: totalKey)
    }
}



