//
//  OrderHistoryViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 17/12/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class OrderHistoryViewModel:ObservableObject{
    @Published var id = ""
    @Published var orderHistoryModel: [OrderHistoryModel] = []
   
    
    
    
    func getOrder(){
        let apiUrl = "https://domhee-api.onrender.com/api/admin/order/\(id)"
        
        AF.request(apiUrl,method: .get).responseJSON { [weak self] response in
            switch response.result {
            case .success(let jsonData):
                if let Order = Mapper<OrderHistoryDataModel>().map(JSONObject: jsonData) {
                    DispatchQueue.main.async {
                        self?.orderHistoryModel = Order.data
                      
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
