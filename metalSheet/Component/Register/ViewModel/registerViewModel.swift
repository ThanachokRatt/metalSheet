//
//  registerViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 1/10/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftUI

class RegisterViewModel: ObservableObject{
    @Published var alertMessage = ""
    @Published var showAlert = false // Control the alert presentation
    @Published var successMessage = "" // Store the success message
    @Published var shouldDismiss = false
    @Published var errorRegisterMessage = ""
    @Published var shouldShow = false
    
    
    func showAlert(message: String) {
        self.alertMessage = message
        self.showAlert = true
    }
   
    
    func registerUser(user: RegisterModel, completion: @escaping () -> Void){
        
        let userJson = user.toJSON()
      //  let apiUrl = "https://domhee-api.onrender.com/api/register"
        let apiUrl = "https://domhee-api.onrender.com/api/sign-up"
        
        AF.request(apiUrl,method: .post,parameters: userJson,encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                            // Set the success message when registration is successful
                             if let jsonDict = value as? [String: Any],
                                let successMessage = jsonDict["msg"] as? String {
                                // Registration is successful, and "msg" key contains the success message
                                self.showAlert(message: successMessage)
                                 self.shouldDismiss = true
                                 self.shouldShow = true
                                 self.successMessage = successMessage
                                 
                            }else if let jsonDict = value as? [String: Any],
                                     let errorMessage = jsonDict["err"] as? String {
                                // Registration failed with an error message
                                self.errorRegisterMessage = errorMessage
                         //       self.showAlert(message: errorMessage)
                           //     self.shouldDismiss = false
                                self.shouldShow = false
                                self.successMessage = errorMessage
                            }
                            // Show the success message in an alert
                completion()
                        case .failure(let error):
                            // Set an error message when registration fails
                            self.showAlert(message: "Registration failed with error: \(error)")
                    self.shouldDismiss = false
                self.successMessage = ( "Registration failed with error:\n \(error)")
                self.shouldShow = true
                
                completion()
                        }
        }
        
    }
    func setErrorMessage(){
        errorRegisterMessage = ""
    }
    func setShouldShow(){
        shouldShow = false
    }
}
