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
    
    let itemsKey: String = "location_List"
    
    init(){
        getItem()
    }
    
    func getItem() {
        //let newItems = {// [
            //            LocationItemModel(name: "ธนโชค รัตนโมรา", phone: "0800731234", addressOne: "92/362 รังสิตนครนายก หมู่บ้านชัยพฤกษ์", adressTwo: "จ.ปทุมธานี เขตธัญบุรี ต.บึงยี่โถ", postCode: "21301", addressType: "ที่บ้าน"),
            //            LocationItemModel(name: "วรภพ อิ่มอร่าม", phone: "0801231234", addressOne: "93/362 รังสิตนครนายก หมู่บ้านชัยพฤกษ์", adressTwo: "จ.ปทุมธานี เขตธัญบุรี ต.บึงยี่โถ", postCode: "21301", addressType: "ที่บ้าน")
            // ]
            //   items.append(contentsOf: newItems)
            guard let data = UserDefaults.standard.data(forKey: itemsKey),
                  let savedItems = try? JSONDecoder().decode([LocationItemModel].self, from: data)
            else{ return}
            
            self.items = savedItems
            
        //}
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func  addItem(name:String,phone:String,addressOne:String,addressTwo:String,postCode:String,addressType:String){
        let newItem = LocationItemModel(name: name, phone: phone, addressOne: addressOne, adressTwo: addressTwo, postCode: postCode, addressType: addressType)
        items.append(newItem)
    }
    func updateItem(item: LocationItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
