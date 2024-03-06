//
//  infoImageViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 22/10/2566 BE.
//

import Foundation
import ObjectMapper
import Alamofire


class HomeViewModel: ObservableObject {
    @Published var homeModel: [InfoDataModel] = [] // Updated to use InfoDataModel

    init() {
        fetchDataHomeApi()
		clearCacheIfNeeded()
    }

    func fetchDataHomeApi() {
		if let cachedData = getCachedData() {
			self.homeModel = cachedData
		} else {
			let apiUrl = "https://domhee-api.onrender.com/api/admin/home"
			
			AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
				switch response.result {
				case .success(let jsonData):
					if let infoImageModel = Mapper<InfoImageModel>().map(JSONObject: jsonData) {
						DispatchQueue.main.async {
							self?.homeModel = infoImageModel.data
							self?.cacheData(infoImageModel.data)
							
						}
					} else {
						print("Error mapping JSON for InfoImageModel")
					}
				case .failure(let error):
					print("Error fetching data: \(error)")
				}
			}
		}
    }
	private func cacheData(_ data: [InfoDataModel]) {
		let encodedData = try? JSONEncoder().encode(data)
		UserDefaults.standard.set(encodedData, forKey: "inFoData")
	}
	
	private func getCachedData() -> [InfoDataModel]? {
		if let cachedData = UserDefaults.standard.data(forKey: "inFoData") {
			do {
				let decodedData = try JSONDecoder().decode([InfoDataModel].self, from: cachedData)
				return decodedData
			} catch {
				print("Error at Cache InFo Home: \(error)")
				return nil
			}
		}
		return nil
	}

	// Function to clear cache if needed and refresh data
		func refreshData() {
			UserDefaults.standard.removeObject(forKey: "inFoData")
			fetchDataHomeApi()
		}
	
	private func clearCacheIfNeeded() {
		let lastClearDateKey = "lastClearDateInfo"
		let lastClearDate = UserDefaults.standard.object(forKey: lastClearDateKey) as? Date ?? Date.distantPast
		
		if Date().timeIntervalSince(lastClearDate) >= 86400{ // 86400 seconds = 1 day
			UserDefaults.standard.removeObject(forKey: "inFoData")
			UserDefaults.standard.set(Date(), forKey: lastClearDateKey)
			fetchDataHomeApi()
		}
	}
}
