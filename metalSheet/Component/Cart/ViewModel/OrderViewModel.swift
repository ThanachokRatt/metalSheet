//
//  OrderViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 13/10/2566 BE.
//


import Foundation
import Alamofire
import ObjectMapper

class OrderViewModel: ObservableObject{
    @Published var id = ""
    @Published var alertMessage = ""
    @Published var showAlert = false
    @Published var shouldDismiss = false
    @Published var showAlert2 = false
    
    func showAlert(message: String){
        self.alertMessage = message
        self.showAlert = true
    }
    
    func saveOrder(user: OrderModel,completion: @escaping () -> Void){
        let userJson = user.toJSON()
        let apiUrl = "https://saprachanapi.onrender.com/order/?uid=\(id)"
        
        AF.request(apiUrl, method: .post, parameters: userJson, encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
				self.shouldDismiss = true
				self.showAlert2 = true
               /* if let jsonDict = value as? [String: Any],
                   let successMessage = jsonDict["succesfully"] as?
                    String{
                    self.showAlert(message: successMessage)
                    self.shouldDismiss = true
                    self.showAlert2 = true
                    
                }else if let jsonDict = value as? [String: Any],
                         let err = jsonDict["err"] as?
                            String{
                    self.showAlert(message: err)
                    self.shouldDismiss = false
                }*/
                completion()
            case .failure(let error):
                self.showAlert(message: "Update failed with error:\(error)")
                self.shouldDismiss = false
				print("Update failed with error:\(error.localizedDescription)")
                completion()
            }
        }
    }
    func setShowAlert2(){
         showAlert2 = false
    }
}



