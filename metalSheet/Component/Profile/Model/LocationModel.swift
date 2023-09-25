//
//  LocationModel.swift
//  metalSheet
//
//  Created by Schweppe on 24/9/2566 BE.
//

import Foundation

struct LocationItemModel: Identifiable,Codable{
    let id: String
    let name: String
    let phone: String
    let addressOne: String
    let adressTwo: String
    let postCode: String
    let addressType:String
    
    init(id: String = UUID().uuidString,name: String, phone: String, addressOne: String, adressTwo: String, postCode: String, addressType: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.addressOne = addressOne
        self.adressTwo = adressTwo
        self.postCode = postCode
        self.addressType = addressType
    }
    func updateCompletion() -> LocationItemModel{
        return LocationItemModel(id: id,name: name, phone: phone, addressOne: addressOne, adressTwo: adressTwo, postCode: postCode, addressType: addressType)
    }
 
}
