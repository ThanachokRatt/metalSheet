//
//  CartViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 9/9/2566 BE.
//

import Foundation
import ObjectMapper
import Alamofire

class CartViewModel: ObservableObject {
    @Published var cartModel: [CartModel] = []
    
    init(){
        fetchDataFromApi()
    }
    
    func fetchDataFromApi(){
        let apiUrl = "https://domhee-api.onrender.com/api/items"
    
        AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
            switch response.result {
            case .success(let jsonData):
                if let cartModels = Mapper<CartModel>().mapArray(JSONObject: jsonData) {
                    self?.cartModel = cartModels
                } else {
                    print("Error mapping JSON to CartModel")
                }
                
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}

