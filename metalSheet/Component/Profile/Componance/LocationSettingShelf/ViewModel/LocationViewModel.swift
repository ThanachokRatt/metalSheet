//
//  LocationViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 24/9/2566 BE.
//

import Foundation

class LocationViewModel: ObservableObject {
    @Published var items: [LocationItemModel] = [] {
        didSet{
            saveItems()
        }
    
    }
    @Published var selectedItemId: String? = nil
    @Published var itemsKey: String = ""
    
   
    
    func getItem() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([LocationItemModel].self, from: data)
        else{ return}
        
        self.items = savedItems
    }
   
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func  addItem(name:String,phone:String,addressOne:String,addressTwo:String,postCode:String,addressType:String,isSelected:Bool){
        let newItem = LocationItemModel(name: name, phone: phone, addressOne: addressOne, adressTwo: addressTwo, postCode: postCode, addressType: addressType,isSelected: isSelected)
        items.append(newItem)
    }
    func updateItem(item: LocationItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
            
            
            for i in 0..<items.count{
                if i != index{
                    items[i].isSelected = false
                }
            }
        }
        
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        } 
    }
    
}
