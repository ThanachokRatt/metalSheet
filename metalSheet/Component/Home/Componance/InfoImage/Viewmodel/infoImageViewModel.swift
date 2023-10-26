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
    }

    func fetchDataHomeApi() {
        let apiUrl = "https://domhee-api.onrender.com/api/admin/home"

        AF.request(apiUrl, method: .get).responseJSON { [weak self] response in
            switch response.result {
            case .success(let jsonData):
                if let infoImageModel = Mapper<InfoImageModel>().map(JSONObject: jsonData) {
                    DispatchQueue.main.async {
                        self?.homeModel = infoImageModel.data
                      
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
