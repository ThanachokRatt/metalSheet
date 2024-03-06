//
//  ViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 21/2/2567 BE.
//

import Foundation
import ObjectMapper
import Alamofire

class MapCardViewModel: ObservableObject {
	@Published var mapCardModel: [MapCardModel] = []
	
	init() {
		fetchDataFromApiLocation()
		clearCacheIfNeeded()
	}
	
	func fetchDataFromApiLocation() {
		if let cachedData = getCachedData() {
			self.mapCardModel = cachedData
		} else {
			let apiUrl = "https://saprachanapi.onrender.com/factory/location/"
			
			AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
				switch response.result {
				case .success(let jsonData):
					if let mapModels = Mapper<MapCardModel>().mapArray(JSONObject: jsonData) {
						self?.mapCardModel = mapModels
						self?.cacheData(mapModels) //improtant
					} else {
						print("Error mapping JSON to CartModel")
					}
					
				case .failure(let error):
					print("Error fetching data: \(error)")
				}
			}
		}
	}
	
	private func cacheData(_ data: [MapCardModel]) {
		let encodedData = try? JSONEncoder().encode(data)
		UserDefaults.standard.set(encodedData, forKey: "cachedMapCardData")
	}
	
	private func getCachedData() -> [MapCardModel]? {
		if let cachedData = UserDefaults.standard.data(forKey: "cachedMapCardData") {
			do {
				let decodedData = try JSONDecoder().decode([MapCardModel].self, from: cachedData)
				return decodedData
			} catch {
				print("Error at Cache Location Home: \(error)")
				return nil
			}
		}
		return nil
	}
	
	func refreshData() {
		UserDefaults.standard.removeObject(forKey: "cachedMapCardData")
		fetchDataFromApiLocation()
	}

	
	private func clearCacheIfNeeded() {
		let lastClearDateKey = "lastClearDate"
		let lastClearDate = UserDefaults.standard.object(forKey: lastClearDateKey) as? Date ?? Date.distantPast
		
		if Date().timeIntervalSince(lastClearDate) >= 86400 { // 86400 seconds = 1 day
			UserDefaults.standard.removeObject(forKey: "cachedMapCardData")
			UserDefaults.standard.set(Date(), forKey: lastClearDateKey)
			fetchDataFromApiLocation()
		}
	}
}
