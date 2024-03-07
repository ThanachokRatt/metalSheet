//
//  DescriptionViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 13/1/2567 BE.
//

import Foundation
import ObjectMapper
import Alamofire

class DescriptionViewModel: ObservableObject {
    @Published var description: [DescriptionModel] = []
    @Published var isDataFetched = false
    @Published var productid = ""
   
    
  
	func fetchDataDesFromApi() {
		if let cachedData = getCachedData() {
			self.description = cachedData
		} else {
			let apiUrl = "https://saprachanapi.onrender.com/item/\(productid)"
			
			AF.request(apiUrl, method: .get).responseJSON { response in
				switch response.result {
				case .success(let jsonData):
					
					if let data = Mapper<DescriptionModel>().map(JSONObject: jsonData) {
						
						self.description = [data] // Assuming 'description' is an array
						self.isDataFetched = true
						self.cacheData([data])
					} else {
						print("Error mapping JSON")
					}
					
				case .failure(let error):
					print("Error fetching data: \(error)")
				}
			}
		}
	}
	private func cacheData(_ data: [DescriptionModel]) {
		let encodedData = try? JSONEncoder().encode(data)
		UserDefaults.standard.set(encodedData, forKey: "product_\(productid)")
	}
	
	private func getCachedData() -> [DescriptionModel]? {
		if let cachedData = UserDefaults.standard.data(forKey: "product_\(productid)") {
			do {
				let decodedData = try JSONDecoder().decode([DescriptionModel].self, from: cachedData)
				return decodedData
			} catch {
				print("Error at Cache Location Home: \(error)")
				return nil
			}
		}
		return nil
	}
	
	func refreshData() {
		UserDefaults.standard.removeObject(forKey: "product_\(productid)")
		fetchDataDesFromApi()
	}

	
	 func clearCacheIfNeeded() {
		let lastClearDateKey = "lastClearDesDate_\(productid)"
		let lastClearDate = UserDefaults.standard.object(forKey: lastClearDateKey) as? Date ?? Date.distantPast
		
		if Date().timeIntervalSince(lastClearDate) >= 43200 { // 86400 seconds = 1 day
			UserDefaults.standard.removeObject(forKey: "product_\(productid)")
			UserDefaults.standard.set(Date(), forKey: lastClearDateKey)
			fetchDataDesFromApi()
		}else{
			fetchDataDesFromApi()
		}
	}

}
