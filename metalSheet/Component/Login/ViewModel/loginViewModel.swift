//
//  loginViewModel.swift
//  metalSheet
//
//  Created by Schweppe on 2/10/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class LoginViewModel: ObservableObject{
    @Published var successMessageLogin = ""
    @Published var errorMessageLogin = ""
    @Published var email = ""
    @Published var token = ""
    @Published var loginSuccess = false
    @Published var name: String = ""
    @Published var phone: String = ""

    
    func loginUser(user: LoginModel, completion: @escaping () -> Void){
        let userJson = user.toJSON()
        let apiUrl = "https://domhee-api.onrender.com/api/login"
        
        AF.request(apiUrl, method: .post, parameters: userJson, encoding: JSONEncoding.default).responseJSON{
            response in
            switch response.result{
                
            case.success(let value):
                if let json = value as? [String: Any]{
                    if let successMessage = json["msg"] as? String{
                        self.successMessageLogin = successMessage
                        print(self.successMessageLogin)
                        self.loginSuccess = true
                    }
                    if let data = json["data"] as? [String: Any]{
                        self.email = data["email"] as? String ?? ""
                        self.token = data["token"] as? String ?? ""
                        self.name = data["name"] as? String ?? ""
                        self.phone = data["phone"] as? String ?? ""
                 
               
            
                        print("Email:  \(self.email)")
                        print("Token: \(self.token)")
                        print("Full-Name:  \(self.name)")
                        print("Phone Number:  \(self.phone)")
                    
                    }
                    
                    if let errorMessage = json["err"] as? String{
                            self.errorMessageLogin = errorMessage
                            print(self.errorMessageLogin)
                        }
        
                }
           
             
                
                completion()
            case.failure(let error):
                print("Registration failed with error: \(error)")
                completion()
            }
        }
    }
}
