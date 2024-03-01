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
        let apiUrl = "https://saprachanapi.onrender.com/item/\(productid)"

        AF.request(apiUrl, method: .get).responseJSON { response in
            switch response.result {
            case .success(let jsonData):
          
                if let data = Mapper<DescriptionModel>().map(JSONObject: jsonData) {
                  
                    self.description = [data] // Assuming 'description' is an array
                    self.isDataFetched = true
                } else {
                    print("Error mapping JSON")
                }

            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }

}
