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
	let locationLink : String
    let addressType:String
    var isSelected: Bool
    
	init(id: String = UUID().uuidString,name: String, phone: String, addressOne: String, adressTwo: String, postCode: String,locationLink: String, addressType: String,isSelected:Bool) {
        self.id = id
        self.name = name
        self.phone = phone
        self.addressOne = addressOne
        self.adressTwo = adressTwo
        self.postCode = postCode
		self.locationLink = locationLink
        self.addressType = addressType
        self.isSelected = isSelected
		
    }
    func updateCompletion() -> LocationItemModel{
		return LocationItemModel(id: id,name: name, phone: phone, addressOne: addressOne, adressTwo: adressTwo, postCode: postCode, locationLink: locationLink, addressType: addressType, isSelected: !isSelected)
    }
 
}
