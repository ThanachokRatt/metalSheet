//
//  PersonalViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 12/10/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class PersonalViewModel: ObservableObject{
    @Published var id = ""
    @Published var alertMessage = ""
    @Published var showAlert = false
    @Published var shouldDismiss = false
    @Published var shouldShow = false
  
    
    func updateUser(user: PersonalModel,completion: @escaping () -> Void){
        let userJson = user.toJSON()
       // let apiUrl = "https://domhee-api.onrender.com/api/user/\(id)"
		let apiUrl = "https://saprachanapi.onrender.com/user/?uid=\(id)"
        
		AF.request(apiUrl, method: .patch, parameters: userJson, encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                if let jsonDict = value as? [String: Any],
                   let successMessage = jsonDict["msg"] as?
                    String{
                  
                    self.shouldDismiss = true
                    self.alertMessage = successMessage
                    self.shouldShow = true
                }
                completion()
            case .failure(let error):
                self.alertMessage = "Update failed with error:\(error)"
                self.shouldDismiss = false
                self.shouldShow = false
                completion()
            }
        }
    }
    func deteleUser(){
        let apiUrl = "https://saprachanapi.onrender.com/user/?uid=\(id)"
        AF.request(apiUrl,method: .delete,encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                if let jsonDict = value as? [String:Any],
                   let successMessage = jsonDict["msg"] as?
                    String{
                    self.alertMessage = successMessage
                    print(self.alertMessage)
                }
            case .failure(let error):
                self.alertMessage = "\(error)"
            }
        }
    }
    func setShowAlert(){
        shouldShow = false
    }
}

