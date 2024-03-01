//
//  ResetPasswordViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 6/10/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class ResetPasswordViewModel: ObservableObject{
    @Published var resetMessage = ""
    @Published var showAlert = false
    @Published var shouldDismiss = false
  
    
    
 
    func resetPassword(user:ResetPasswordModel,completion: @escaping () -> Void){
        let userJson = user.toJSON()
        let apiUrl = "https://saprachanapi.onrender.com/user/resetPassword"
        
      
		AF.request(apiUrl, method: .patch, parameters: userJson, encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case.success(let value):
                if let json = value as? [String: Any]{
                    if let successMessage = json["msg"] as? String{
                        self.resetMessage = successMessage
                        self.shouldDismiss = true
                        self.showAlert = true
                        
                        
                    }
                }
                completion()
            case .failure(let error):
                self.showAlert = false
                 print("Reset Password with error: \(error)")
                completion()
            }
        }
    }
    func setShowAlertResetPassword(){
        showAlert = false
    }
}
