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
    
    func showAlertResetPassword(message: String) {
        self.resetMessage = message
        self.showAlert = true
    }
    func resetPassword(user:ResetPasswordModel,completion: @escaping () -> Void){
        let userJson = user.toJSON()
        let apiUrl = "https://domhee-api.onrender.com/api/reset-password"
      
        AF.request(apiUrl, method: .post, parameters: userJson, encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
            case.success(let value):
                if let json = value as? [String: Any]{
                    if let successMessage = json["msg"] as? String{
                        self.showAlertResetPassword(message: successMessage)
                        self.shouldDismiss = true
                        
                    }
                }
                completion()
            case .failure(let error):
                print("Reset Password with error: \(error)")
                completion()
            }
        }
        
    }
}
