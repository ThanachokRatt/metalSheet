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
		clearCacheIfNeeded()
    }
    
    func fetchDataFromApi(){
		if let cachedData = getCachedData() {
			self.cartModel = cachedData
		} else {
			let apiUrl = "https://saprachanapi.onrender.com/item"
			
			AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
				switch response.result {
				case .success(let jsonData):
					if let cartModels = Mapper<CartModel>().mapArray(JSONObject: jsonData) {
						self?.cartModel = cartModels
						self?.cacheData(cartModels)
					} else {
						print("Error mapping JSON to CartModel")
					}
					
				case .failure(let error):
					print("Error fetching data: \(error)")
				}
			}
		}
    }
	private func cacheData(_ data: [CartModel]) {
		let encodedData = try? JSONEncoder().encode(data)
		UserDefaults.standard.set(encodedData, forKey: "cartData")
	}
	
	private func getCachedData() -> [CartModel]? {
		if let cachedData = UserDefaults.standard.data(forKey: "cartData") {
			do {
				let decodedData = try JSONDecoder().decode([CartModel].self, from: cachedData)
				return decodedData
			} catch {
				print("Error at Cache Location Home: \(error)")
				return nil
			}
		}
		return nil
	}
	
	func refreshData() {
			UserDefaults.standard.removeObject(forKey: "cartData")
		fetchDataFromApi()
	}

	
	private func clearCacheIfNeeded() {
		let lastClearDateKey = "lastClearCartDate"
		let lastClearDate = UserDefaults.standard.object(forKey: lastClearDateKey) as? Date ?? Date.distantPast
		
		if Date().timeIntervalSince(lastClearDate) >= 86400 { // 86400 seconds = 1 day
			UserDefaults.standard.removeObject(forKey: "cartData")
			UserDefaults.standard.set(Date(), forKey: lastClearDateKey)
			fetchDataFromApi()
		}
	}
}

