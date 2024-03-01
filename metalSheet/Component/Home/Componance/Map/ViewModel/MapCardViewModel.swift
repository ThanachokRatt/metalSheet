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
	
	init(){
		fetchDataFromApilocation()
	}
	
	func fetchDataFromApilocation(){
		let apiUrl = "https://saprachanapi.onrender.com/factory/location/"
	
		AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
			switch response.result {
			case .success(let jsonData):
				if let mapModels = Mapper<MapCardModel>().mapArray(JSONObject: jsonData) {
					self?.mapCardModel = mapModels
			   
				} else {
					print("Error mapping JSON to CartModel")
				}
				
			case .failure(let error):
				print("Error fetching data: \(error)")
			}
		}
	}
}

